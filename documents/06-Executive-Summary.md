# 06 — Executive Summary

**Project:** Northwind Health | IAM User Access Review  
**Document Reference:** IAM-DOC-06-ES  
**Review Date:** 5 October 2026

---

## 1. Review Overview

An IAM access review was conducted to reconcile Northwind Health's HR records against user accounts in the patient administration portal.

The review identified seven accounts requiring assessment, including access activity recorded after employment or contract end dates, an orphaned Admin account, shared credentials and access requiring further business justification.

## 2. Key Findings

| Severity | Finding | Business Risk |
|---|---|---|
| **Critical** | Two accounts recorded login activity after employment or contract end dates, including one with Admin privileges. | Potential unauthorised access to a system containing patient information. |
| **High** | An orphaned Admin account and a shared login with a password stored in a team wiki. | Unmanaged privileged access, weak accountability and credential exposure. |
| **Medium** | Access held by an employee on extended leave and a Finance user whose portal access requires justification. | Unnecessary access may remain available without appropriate review. |
| **Low** | An Engineering employee assigned Admin privileges. | Continued need for elevated access requires documentation. |

The available records do not confirm that patient information was accessed improperly or that a data breach occurred.

## 3. Immediate Priorities

**First priority — `treyes`:** Confirm whether the contractor's agreement and Admin access were formally extended. If authorisation has expired, disable the account and investigate activity recorded after the contract end date.

**Critical parallel action — `skim`:** Verify the account's current status, disable it if still active and investigate the login recorded after employment termination.

The shared account password should also be rotated immediately, and the orphaned Admin account reviewed for removal.

## 4. Management Recommendations

| Recommendation | Expected Benefit |
|---|---|
| Introduce HR-triggered employee offboarding. | Timely removal of access when employment ends. |
| Apply automatic expiry dates to contractor accounts. | Reduce access continuing beyond approved contracts. |
| Review dormant and orphaned accounts and assign named owners. | Improve accountability and reduce unmanaged access. |
| Replace shared logins with named user accounts. | Strengthen individual accountability and auditability. |
| Conduct quarterly access reviews with documented Admin justification. | Support least privilege and ongoing access governance. |

## 5. Conclusion

The review highlights weaknesses in access lifecycle management and account governance that could expose Northwind Health to unnecessary security risk.

Immediate validation of the two Critical findings, followed by stronger offboarding, account ownership and periodic access reviews, would reduce the likelihood of similar issues recurring.
