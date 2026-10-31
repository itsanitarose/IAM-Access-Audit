# 05 — Remediation and Preventive Controls

**Case Study:** Northwind Health | IAM User Access Review       
**Scenario date:** 5 October 2026


---

## 1. Remediation Approach

Remediation is prioritised according to the severity of the findings, the level of account privileges and the potential impact on patient information.

Immediate actions focus on verifying and containing potentially unauthorised access. Longer-term controls address weaknesses in identity lifecycle management, account ownership and access governance.

## 2. Corrective Action Plan

| Account | Priority | Recommended Corrective Action |
|---|---|---|
| `skim` | Critical | Disable access if still active; preserve and investigate post-termination activity. |
| `treyes` | Critical | Confirm contract extension immediately; if none exists, disable the Admin account and investigate activity after contract expiry. |
| `testadmin` | High | Confirm the account is no longer required, then remove the orphaned Admin account. |
| `support-shared` | High | Rotate the exposed password immediately, remove it from the wiki and replace shared access with named accounts. |
| `lgrant` | Medium | Confirm leave arrangements and suspend access until return, where appropriate. |
| `pnair` | Medium | Confirm the business need for patient administration portal access; remove access if unjustified. |
| `dholt` | Low | Confirm and document the business justification for Admin privileges. |

## 3. Preventive Control Recommendations

| Control Area | Recommended Control | Intended Outcome |
|---|---|---|
| Employee Offboarding | Automate deprovisioning using HR termination events. | Remove access promptly when employment ends. |
| Contractor Access | Set automatic account expiry dates aligned with approved contract end dates. | Prevent access continuing after contracts expire. |
| Orphaned and Dormant Accounts | Assign a named owner to every account and implement inactivity reviews with a 60–90-day disable threshold, subject to operational checks. | Reduce unmanaged and unnecessary access. |
| Shared Accounts | Prohibit routine shared logins and require individually assigned accounts. | Improve accountability and traceability. |
| Privileged Access | Require documented justification for Admin access and quarterly access reviews approved by the relevant data owner. | Enforce least privilege and ongoing access oversight. |

## 4. Implementation and Validation

| Stage | Recommended Activity |
|---|---|
| Immediate Containment | Verify critical account authorisation, disable access where required and investigate relevant login activity. |
| Corrective Remediation | Address orphaned accounts, exposed credentials, unnecessary access and undocumented privileges. |
| Control Implementation | Introduce HR-linked offboarding, contractor expiry, account ownership and periodic access reviews. |
| Validation | Confirm account changes, retain approval records and verify that access review controls operate as intended. |

Remediation actions should be recorded with an accountable owner, completion status and supporting evidence. Recommendations in this plan do not represent changes already implemented.
