# Northwind Health - IAM Remediation
# Disables non-compliant accounts, removes excessive privilege, and verifies the changes
# Usage: .\Invoke-Remediation.ps1

Write-Host "=== Northwind Health - IAM Remediation ===" -ForegroundColor Cyan
Write-Host "Remediation Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm')" -ForegroundColor Gray
Write-Host ""

# Connect to Microsoft Graph if not already connected
if (-not (Get-MgContext)) {
    Connect-MgGraph -TenantId 'c7ccb571-3485-445e-81e5-400654569d4d' -Scopes 'User.ReadWrite.All','RoleManagement.ReadWrite.Directory' -ContextScope Process -NoWelcome
}

# Define the accounts to remediate
$AccountsToDisable = @(
    'sarah.kim@itsanitaroseoutlook.onmicrosoft.com',      # Critical: Terminated employee
    'tom.reyes@itsanitaroseoutlook.onmicrosoft.com',      # Critical: Expired contractor
    'support-shared@itsanitaroseoutlook.onmicrosoft.com', # High: Shared account
    'testadmin@itsanitaroseoutlook.onmicrosoft.com',      # High: Unowned account
    'lisa.grant@itsanitaroseoutlook.onmicrosoft.com'     # Medium: On leave, dormant access
)

$RoleRemovalUser = 'dan.holt@itsanitaroseoutlook.onmicrosoft.com'  # High: Excessive privilege

# ============================================================
# STEP 1: Disable non-compliant accounts
# ============================================================

Write-Host "=== STEP 1: Disabling non-compliant accounts ===" -ForegroundColor Cyan

foreach ($UPN in $AccountsToDisable) {
    try {
        Update-MgUser -UserId $UPN -AccountEnabled:$false
        Write-Host "  [OK] Disabled: $UPN" -ForegroundColor Green
    }
    catch {
        Write-Host "  [!] Failed to disable ${UPN}: $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host ""

# ============================================================
# STEP 2: Remove Dan Holt's User Administrator role
# ============================================================

Write-Host "=== STEP 2: Removing excessive privilege (Dan Holt) ===" -ForegroundColor Cyan

try {
    $Role = Get-MgDirectoryRole -Filter "DisplayName eq 'User Administrator'"
    $User = Get-MgUser -Filter "userPrincipalName eq '$RoleRemovalUser'"

    if ($Role -and $User) {
        Remove-MgDirectoryRoleMemberByRef -DirectoryRoleId $Role.Id -DirectoryObjectId $User.Id
        Write-Host "  [OK] Removed User Administrator role from: $RoleRemovalUser" -ForegroundColor Green
    }
    else {
        Write-Host "  [!] Could not find role or user." -ForegroundColor Yellow
    }
}
catch {
    Write-Host "  [!] Failed to remove role: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""

# ============================================================
# STEP 3: Verify the changes
# ============================================================

Write-Host "=== STEP 3: Verification ===" -ForegroundColor Cyan

# Verify account states
Write-Host ""
Write-Host "Account states (expected: all False except dan.holt and priya.nair):" -ForegroundColor Gray

$VerificationUPNs = $AccountsToDisable + @(
    'dan.holt@itsanitaroseoutlook.onmicrosoft.com',
    'priya.nair@itsanitaroseoutlook.onmicrosoft.com'
)

$Filter = ($VerificationUPNs | ForEach-Object { "userPrincipalName eq '$_'" }) -join ' or '
$VerificationResults = Get-MgUser -Filter $Filter -Property DisplayName, UserPrincipalName, AccountEnabled

$VerificationResults | Select-Object DisplayName, UserPrincipalName, AccountEnabled | Format-Table -AutoSize

# Verify Dan Holt's role removal
Write-Host ""
Write-Host "User Administrator role members (should NOT include Dan Holt):" -ForegroundColor Gray

$Role = Get-MgDirectoryRole -Filter "DisplayName eq 'User Administrator'"
$RoleMembers = Get-MgDirectoryRoleMember -DirectoryRoleId $Role.Id

$DanHoltUser = $VerificationResults | Where-Object { $_.UserPrincipalName -like 'dan.holt*' }
$DanHoltStillHasRole = $RoleMembers.Id -contains $DanHoltUser.Id

if ($DanHoltStillHasRole) {
    Write-Host "  [!] WARNING: Dan Holt still has the User Administrator role!" -ForegroundColor Red
}
else {
    Write-Host "  [OK] Dan Holt no longer has the User Administrator role." -ForegroundColor Green
}

# ============================================================
# SUMMARY
# ============================================================

Write-Host ""
Write-Host "=== REMEDIATION COMPLETE ===" -ForegroundColor Cyan
Write-Host "Accounts disabled: $($AccountsToDisable.Count)"
Write-Host "Roles removed:     1 (User Administrator from Dan Holt)"
Write-Host "Verification:       Account states and role membership checked above."
