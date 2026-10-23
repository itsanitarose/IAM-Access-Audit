# PowerShell Scripts

PowerShell automation for the Northwind Health IAM access review and remediation lab using Microsoft Graph and Microsoft Entra ID.

## Scripts

| Script | Purpose |
|---|---|
| [Invoke-AccessReview.ps1](./Invoke-AccessReview.ps1) | Reconcile HR records with Entra ID identities, detect account and privilege discrepancies, assess access risks, and export findings for review. |
| [Invoke-Remediation.ps1](./Invoke-Remediation.ps1) | Apply approved corrective actions to noncompliant accounts and excessive privileges, then verify the resulting identity and access states. |

## Workflow

**Reconcile → Assess → Remediate → Verify**

## Requirements

- PowerShell 7
- Microsoft Graph PowerShell SDK
- Appropriate Microsoft Graph permissions and Microsoft Entra ID administrative privileges
