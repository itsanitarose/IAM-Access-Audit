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

**02. Is the access still appropriate?**
I reviewed permissions, Admin access and shared credentials against job responsibilities.

**03. What needs further investigation?**
I checked who owned each account, why it was needed and who could confirm its access.

**04. What needed my attention first?**
I prioritised the risks, recommended what should change and considered how to prevent the same issues happening again.

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

Coming from a different professional background, I brought my existing communication style into this first IAM assignment. As I worked through it, I learned to express my findings using more precise security terminology, including orphaned accounts, dormant accounts, account ownership, deprovisioning and access recertification. It wasn’t about changing how I communicate, but adapting my language to the field.

My thinking shifted too. At first, my approach was purely analytical, focused on spotting accounts that looked wrong. As I worked through the evidence, I started asking sharper questions. Why does this account still have access? Is it actually inappropriate? What information is missing? What could happen if I make the wrong decision?

As a result, I began to see IAM as more than simply granting or removing access. It's about understanding why access exists in the first place. Security decisions shouldn't be based on technical considerations alone. They also need to account for business operations, avoid unnecessary disruption and maintain security.

---

## Supporting Documents

| Document | Details |
|---|---|
| [Findings & Recommendations](https://github.com/itsanitarose/IAM-Access-Review/tree/main/01-Documents) | Findings, risk ratings, priorities, and corrective actions |
| [Preventive Controls](https://github.com/itsanitarose/IAM-Access-Review/tree/main/01-Documents) | Root causes and recommendations to prevent recurrence |
| [Lab & Testing](https://github.com/itsanitarose/IAM-Access-Review/tree/main/02-Lab/Entra%20ID) | Entra ID changes, PowerShell scripts, and test evidence |

---

[Job Requirements Map](./Job-Requirements-Map.md) | [Back to IAM Case Studies](https://github.com/itsanitarose/IAM-Case-Studies) | [GitHub Profile](https://github.com/itsanitarose)
