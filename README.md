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

**Four questions guided my investigation:**

**01. Does the account match HR records?**  
I checked employment status, contract end dates and recent activity.

**02. Is the access appropriate?**  
I reviewed permissions, privileged access and shared credentials against job responsibilities.

**03. What needs further investigation?**  
I identified gaps in ownership, approval and business need, along with who could confirm them.

**04. What happens next?**  
I assessed the risks, prioritised findings and recommended corrective and preventive actions.

Throughout the review, I separated what the evidence confirmed from what still needed investigation.

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

I prioritised this account because its privileged access increased the potential impact.

**My recommendation:** Confirm whether the contract was extended. If no valid approval exists, disable the account and investigate the activity.

The records raise a serious concern, but they do not establish that a breach occurred.

---

## What I Learned

This review reinforced three things for me:

- **Access needs continuous validation.** An active account doesn't necessarily mean its access is still appropriate.
- **Evidence matters more than assumptions.** A suspicious login calls for investigation, not an immediate conclusion that a breach occurred.
- **Prevention matters as much as remediation.** Fixing individual accounts is only part of the job. The process that allowed the issue needs attention too.

---

## Supporting Documents

| Document | Details |
|---|---|
| [Findings & Recommendations](https://github.com/itsanitarose/IAM-Access-Review/tree/main/01-Documents) | Findings, risk ratings, priorities, and corrective actions |
| [Preventive Controls](https://github.com/itsanitarose/IAM-Access-Review/tree/main/01-Documents) | Root causes and recommendations to prevent recurrence |
| [Lab & Testing](https://github.com/itsanitarose/IAM-Access-Review/tree/main/02-Lab/Entra%20ID) | Entra ID changes, PowerShell scripts, and test evidence |

---

[Job Requirements Map](./Job-Requirements-Map.md) | [Back to IAM Case Studies](https://github.com/itsanitarose/IAM-Case-Studies) | [GitHub Profile](https://github.com/itsanitarose)
