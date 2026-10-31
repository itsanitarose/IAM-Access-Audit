# IAM: The Access Audit

## The Scenario

Northwind Health is a fictional healthcare organisation supporting approximately 400 clinics and handling sensitive patient information (ePHI).

It's my first week on the security team, and I've been handed my first ticket.

### 📁 The Ticket

**IT Manager's Request:**

> "We've never properly reconciled the patient admin portal against HR. Here are both exports. Tell me what's wrong, what to fix first, and how we stop it happening again."

*Audit date: 5 October 2026*

**[View Source Materials](./01-Documents/)**

---

## My Approach

I reviewed seven patient administration portal accounts against HR records, looking for access that no longer made sense.

**I worked through four questions:**

**01. Does the account match HR records?**  
I checked employment status, contract end dates and recent activity.

**02. Is the access appropriate?**  
I reviewed permissions, admin access and shared credentials against job responsibilities.

**03. What needs further investigation?**  
I checked who owned each account, why it was needed, and who could confirm its access.

**04. What happens next?**  
I decided what needed attention first, what should change, and how to stop the same issues happening again.

Throughout the review, I separated what the evidence showed from what still needed checking.

---

## Key Findings

| Severity | Accounts | Finding |
|---|---:|---|
| 🔴 Critical | 2 | Login activity after employment or contract end dates |
| 🟠 High | 2 | Orphaned admin account and shared credentials |
| 🟡 Medium | 2 | Extended leave and Finance access requiring review |
| 🟢 Low | 1 | Engineering admin access requiring justification |
| **Total** | **7** | |

### Top Priority: `treyes`

The contractor's recorded end date was 31 July 2026, but an admin login occurred on 28 September 2026.

I put this account first because it had admin access, so misuse could cause more damage.

**My recommendation:** Confirm whether the contract was extended. If no valid approval exists, disable the account and investigate the activity.

The records raise a serious concern, but they do not establish that a breach occurred.

---

## Lab Outcome

The access review is complete. I implemented and tested selected changes in Microsoft Entra ID.

**[View Lab & Testing Evidence](./02-Lab/Entra%20ID/)**

---

## What I Learned

- An account can still be active even when the person no longer needs access.
- A login after someone's recorded leaving date needs investigating, but it doesn't prove a breach happened.
- Fixing an account isn't enough. I also need to understand why the access was left in place and how to stop it happening again.

---

## Supporting Documents

| Document | Details |
|---|---|
| [Findings & Recommendations](https://github.com/itsanitarose/IAM-Access-Review/tree/main/01-Documents) | Findings, risk ratings, priorities, and corrective actions |
| [Preventive Controls](https://github.com/itsanitarose/IAM-Access-Review/tree/main/01-Documents) | Root causes and recommendations to prevent recurrence |
| [Lab & Testing](https://github.com/itsanitarose/IAM-Access-Review/tree/main/02-Lab/Entra%20ID) | Entra ID changes, PowerShell scripts, and test evidence |

---

[Job Requirements Map](./Job-Requirements-Map.md) | [Back to IAM Case Studies](https://github.com/itsanitarose/IAM-Case-Studies) | [GitHub Profile](https://github.com/itsanitarose)
