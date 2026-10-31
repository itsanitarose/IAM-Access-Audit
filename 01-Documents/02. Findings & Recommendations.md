# 02. Findings & Recommendations



## 1. What I Found

| Account | Observation |
|---|---|
| skim | Employment ended on 15 August, but a login was recorded on 2 September. |
| treyes | Contract ended on 31 July, but an Admin login was recorded on 28 September. A contract extension needs confirming. |
| testadmin | Admin account created by an engineer who has since left, with no confirmed owner. Last login: 20 November 2025. |
| support-shared | Shared account with its password stored in a team wiki. The account alone does not show who performed an action. |
| lgrant | Employee on extended leave. No login recorded since 11 May. |
| pnair | Finance employee with read-only portal access. The reason for this access needs confirming. |
| dholt | Engineering employee with Admin access. The reason for this access needs confirming and documenting. |

## 2. Risk Ratings & Recommended Actions

These ratings reflect the information available. Some accounts need further checks before deciding whether access should change.

| Account | Severity | Recommended action |
|---|---|---|
| skim | 🔴 Critical | Disable the account if still active and investigate the login after termination. |
| treyes | 🔴 Critical | Confirm whether the contract was extended. If no valid authorisation exists, disable access and investigate the login. |
| testadmin | 🟠 High | Confirm who owns the account and whether it is needed. Disable it if no valid owner or purpose can be established. |
| support-shared | 🟠 High | Rotate the password, remove it from the wiki, and move users to individual accounts before retiring the shared login. |
| lgrant | 🟡 Medium | Confirm the leave arrangements and whether access is needed while the employee is away. |
| pnair | 🟡 Medium | Confirm why portal access is needed. Remove it if there is no valid business reason. |
| dholt | 🟢 Low | Confirm and document why Admin access is needed. Reduce permissions if that level of access is unnecessary. |

## 3. How I Rated the Risks

I considered how likely the access was to be misused and how much harm that could cause, including the permissions involved and the sensitivity of patient data. My approach was informed by the [OWASP Risk Rating Methodology](https://community.owasp.org/OWASP_Risk_Rating_Methodology).

## 4. What Needs Attention First

### First Priority: treyes

The recorded contract end date was 31 July 2026, but an Admin login occurred on 28 September.

I put this account first because it had Admin access, so misuse could cause more damage.

Recommended next steps:

1. Confirm whether the contract was extended.
2. Check whether Admin access is still authorised.
3. If no valid authorisation exists, disable access and investigate the activity.

### Also Critical: skim

The employee left on 15 August 2026, but a login was recorded on 2 September.

Recommended next steps:

1. Check whether the account is still active.
2. Disable it if it remains active.
3. Investigate the login after termination.

### What the Records Don’t Tell Us

These logins need investigating, but they do not prove who used the accounts, whether patient information was accessed, or whether a breach occurred.

---

[Back to Overview](../README.md)
