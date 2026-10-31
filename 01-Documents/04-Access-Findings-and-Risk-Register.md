# 04 — Access Findings and Risk Register

**Case Study:** Northwind Health | IAM User Access Audit  
**Scenario date:** 5 October 2026


---

## 1. Findings Overview

The reconciliation of HR records and patient administration portal access identified seven accounts requiring review.

Findings are classified using the qualitative risk assessment methodology, considering employment status, account privileges, accountability and potential exposure of patient information.

## 2. Access Risk Register

| ID | Account | Finding | Severity | Recommended Action |
|---|---|---|---|---|
| IAM-01 | `skim` | Employee terminated on 15 August; portal login recorded on 2 September. | **Critical** | Disable immediately if still active; investigate post-termination access. |
| IAM-02 | `treyes` | Contractor ended on 31 July; Admin login recorded on 28 September. | **Critical** | Confirm contract extension; if none, disable and investigate privileged activity. |
| IAM-03 | `testadmin` | Orphaned Admin account created by an engineer who has left; dormant since November 2025. | **High** | Remove the account after confirming it is no longer required. |
| IAM-04 | `support-shared` | Shared login with password stored in a team wiki. | **High** | Rotate the password immediately and replace with named accounts. |
| IAM-05 | `lgrant` | Employee on leave; no recorded login since May. | **Medium** | Suspend access until return, subject to confirmation of leave arrangements. |
| IAM-06 | `pnair` | Finance employee with read-only portal access; business need requires confirmation. | **Medium** | Confirm business justification; remove access if unnecessary. |
| IAM-07 | `dholt` | Engineering employee assigned Admin privileges. | **Low** | Confirm and document the business justification for Admin access. |

## 3. Critical Findings and Supporting Evidence

| Account | HR Record | Portal Record | Risk |
|---|---|---|---|
| `skim` | Terminated 15 August 2026. | Support Agent login on 2 September 2026. | Post-termination activity creates a potential unauthorised access concern. |
| `treyes` | Contract ended 31 July 2026. | Admin login on 28 September 2026. | Post-contract-end privileged activity presents potentially greater security impact. |

Both accounts require urgent review. The records indicate concerning access activity but do not establish whether patient data was accessed or compromised.

## 4. Risk Prioritisation

**Top priority: IAM-02 — `treyes`**

The `treyes` account is prioritised because it combines activity after the recorded contract end date with Admin privileges, increasing the potential impact of unauthorised access.

The contract extension must be confirmed immediately. If no valid extension exists, access should be disabled and activity investigated.

**IAM-01 — `skim`** is also Critical and requires immediate attention because a login occurred after employment termination.

## 5. Risk Distribution

| Severity | Findings |
|---|---:|
| Critical | 2 |
| High | 2 |
| Medium | 2 |
| Low | 1 |
| **Total** | **7** |
