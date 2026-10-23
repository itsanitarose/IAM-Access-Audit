# PowerShell Scripts

PowerShell automation for the Northwind Health IAM access review and remediation lab using Microsoft Graph and Microsoft Entra ID.

## Scripts

| Script | Purpose |
|---|---|
| `Invoke-AccessReview.ps1` | Reconcile HR records with Entra ID accounts, identify access risks, and export findings. |
| `Invoke-Remediation.ps1` | Apply approved account and privilege changes, then verify the results. |

## Workflow

**Reconcile → Assess → Remediate → Verify**

## Execution

```powershell
.\Invoke-AccessReview.ps1
.\Invoke-Remediation.ps1
```

## Requirements

- PowerShell 7
- Microsoft Graph PowerShell SDK
- Appropriate Graph permissions and Entra ID administrative role

## Evidence

[Execution & Verification Screenshots](../screenshots/)

[Access Review Documentation](../../../documents/)
