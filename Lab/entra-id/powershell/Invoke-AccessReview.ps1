# Northwind Health - IAM User Access Review
# Reconciles HR employment data against Microsoft Entra ID account states
# Usage: .\Invoke-AccessReview.ps1

param(
    [string]$HrCsvPath = "$env:USERPROFILE\Downloads\northwind-hr-data.csv",
    [string]$OutputPath = "$env:USERPROFILE\Downloads\access-review-findings.csv"
)

Write-Host "=== Northwind Health - IAM User Access Review ===" -ForegroundColor Cyan
Write-Host "Review Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm')" -ForegroundColor Gray
Write-Host ""

# Connect to Microsoft Graph if not already connected
if (-not (Get-MgContext)) {
    Connect-MgGraph -TenantId 'c7ccb571-3485-445e-81e5-400654569d4d' -Scopes 'User.ReadWrite.All','RoleManagement.Read.Directory' -ContextScope Process -NoWelcome
}

# Load HR data
Write-Host "Loading HR data from: $HrCsvPath" -ForegroundColor Gray
$HrData = Import-Csv -Path $HrCsvPath
Write-Host "Loaded $($HrData.Count) HR records" -ForegroundColor Gray
Write-Host ""

# Get all Entra ID users
Write-Host "Retrieving Entra ID accounts..." -ForegroundColor Gray
$EntraUsers = Get-MgUser -All -Property Id, DisplayName, UserPrincipalName, AccountEnabled, Department
Write-Host "Retrieved $($EntraUsers.Count) accounts from Entra ID" -ForegroundColor Gray
Write-Host ""

# Get User Administrator role members (for privilege check)
$UserAdminRole = Get-MgDirectoryRole -Filter "DisplayName eq 'User Administrator'"
$UserAdminMembers = if ($UserAdminRole) { Get-MgDirectoryRoleMember -DirectoryRoleId $UserAdminRole.Id } else { @() }

$Findings = @()

Write-Host "=== RECONCILIATION RESULTS ===" -ForegroundColor Cyan

foreach ($HrRecord in $HrData) {
    $EntraUser = $EntraUsers | Where-Object { $_.UserPrincipalName -eq $HrRecord.UserPrincipalName }

    # Check if account exists in Entra
    if (-not $EntraUser) {
        $Findings += [PSCustomObject]@{
            Account     = $HrRecord.UserPrincipalName
            HRStatus    = $HrRecord.EmploymentStatus
            EntraState = 'NOT FOUND'
            Finding     = 'HR record has no matching Entra account'
            Severity    = 'Medium'
            Action      = 'Verify account was properly removed'
        }
        Write-Host "  [!] $($HrRecord.DisplayName): No Entra account found" -ForegroundColor Yellow
        continue
    }

    $FindingText = ''
    $Severity    = ''
    $Action      = ''

    # Check 1: Terminated or Expired but account still enabled
    if ($HrRecord.EmploymentStatus -match 'Terminated|Expired' -and $EntraUser.AccountEnabled) {
        $FindingText = "HR shows $($HrRecord.EmploymentStatus) (end date: $($HrRecord.EndDate)) but account is still ENABLED"
        $Severity    = 'Critical'
        $Action      = 'Disable account immediately and review activity'
    }
    # Check 2: Shared account (no individual attribution)
    elseif ($HrRecord.EmploymentStatus -match 'Shared') {
        $FindingText = "Shared account prevents individual attribution; credentials may be exposed"
        $Severity    = 'High'
        $Action      = 'Replace with individual accounts or formally approve and restrict'
    }
    # Check 3: No HR record / unowned account
    elseif ($HrRecord.EmploymentStatus -match 'No HR Record') {
        $FindingText = "Unowned account with no business justification"
        $Severity    = 'High'
        $Action      = 'Verify owner and purpose; disable if not justified'
    }
    # Check 4: On leave but account still active
    elseif ($HrRecord.EmploymentStatus -match 'On Leave' -and $EntraUser.AccountEnabled) {
        $FindingText = "Employee on extended leave but account remains active"
        $Severity    = 'Medium'
        $Action      = 'Confirm leave policy; suspend access if not required'
    }
    # Check 5: Active employee holds User Administrator role (excessive privilege)
    elseif ($HrRecord.UserPrincipalName -like 'dan.holt*' -and $UserAdminMembers.Id -contains $EntraUser.Id) {
        $FindingText = "Active employee holds User Administrator role - may exceed Engineering requirements"
        $Severity    = 'High'
        $Action      = 'Confirm business need; remove if not justified'
    }

    # Record the finding or mark as OK
    if ($FindingText) {
        $Findings += [PSCustomObject]@{
            Account     = $HrRecord.UserPrincipalName
            HRStatus    = $HrRecord.EmploymentStatus
            EntraState = "Enabled=$($EntraUser.AccountEnabled)"
            Finding     = $FindingText
            Severity    = $Severity
            Action      = $Action
        }
        Write-Host "  [!] $($HrRecord.DisplayName): $FindingText" -ForegroundColor Red
    }
    else {
        Write-Host "  [OK] $($HrRecord.DisplayName): No discrepancy" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "=== SUMMARY ===" -ForegroundColor Cyan
Write-Host "HR records reviewed:  $($HrData.Count)"
Write-Host "Findings identified: $($Findings.Count)"

if ($Findings.Count -gt 0) {
    Write-Host "  Critical: $(($Findings | Where-Object Severity -eq 'Critical').Count)" -ForegroundColor Red
    Write-Host "  High:     $(($Findings | Where-Object Severity -eq 'High').Count)" -ForegroundColor Yellow
    Write-Host "  Medium:   $(($Findings | Where-Object Severity -eq 'Medium').Count)" -ForegroundColor Yellow
    $Findings | Export-Csv -Path $OutputPath -NoTypeInformation
    Write-Host ""
    Write-Host "Findings exported to: $OutputPath" -ForegroundColor Green
}
else {
    Write-Host "No findings - all accounts are consistent with HR data." -ForegroundColor Green
}
