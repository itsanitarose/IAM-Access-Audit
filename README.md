# IAM User Access Review | Northwind Health

A fictional Identity and Access Management (IAM) case study focused on reviewing user access, identifying security risks and recommending improvements to access controls.

## Overview

Northwind Health is a healthcare SaaS company handling sensitive patient information. The task was to review access to its patient administration portal and identify differences between HR records and application accounts.

I reviewed seven accounts, compared employment and contract details against portal access records, assessed the risks and documented recommended actions.

**The objective:** Identify access issues, explain which should be addressed first and recommend controls to prevent similar problems.

## Key Findings

| Severity | Count | Findings |
|---|---:|---|
| 🔴 **Critical** | 2 | Login activity after employment or contract end dates |
| 🟠 **High** | 2 | Orphaned Admin account and shared credentials |
| 🟡 **Medium** | 2 | Access during extended leave and Finance access requiring review |
| 🟢 **Low** | 1 | Engineering Admin access requiring justification |
| **Total** | **7** | |

## Top Priority — `treyes`

The contractor's recorded end date was 31 July 2026, but an Admin login occurred on 28 September 2026. I prioritised this account because Admin privileges increase the potential impact of unauthorised access.

I recommended confirming whether a contract extension had been approved with the relevant business owner. If no approved extension exists, the account should be disabled and the activity investigated.

The available records do not confirm a data breach.

## Project Structure

| Document | Purpose |
|---|---|
| [01 — Scenario and Scope](documents/01-Scenario-and-Scope.md) | Defines the review objectives and scope |
| [02 — User Access Inventory](documents/02-User-Access-Inventory.md) | Compares HR and application access records |
| [03 — Access Risk Methodology](documents/03-Access-Risk-Methodology.md) | Explains how risks were assessed |
| [04 — Access Findings and Risk Register](documents/04-Access-Findings-and-Risk-Register.md) | Documents findings, severity and priorities |
| [05 — Remediation and Preventive Controls](documents/05-Remediation-and-Preventive-Controls.md) | Recommends corrective actions and preventive controls |
| [06 — Executive Summary](documents/06-Executive-Summary.md) | Summarises findings and recommendations for management |
| [07 — Microsoft Entra ID Practical Lab](./02-Lab/Entra%20ID/) | PowerShell-based access reconciliation, remediation, and verification using Microsoft Entra ID. |
| [Job Requirements Map](Job-Requirements-Map.md) | Links project evidence to IAM job requirements |

## IAM Skills Demonstrated

- User access reviews and HR-to-application reconciliation
- Joiner–Mover–Leaver (JML) risk identification
- Privileged access and least-privilege assessment
- Qualitative risk assessment and prioritisation
- Access governance and remediation recommendations
- Documentation and management reporting

## What I Learned

This project strengthened my ability to compare access records, identify discrepancies and prioritise findings based on risk.

A key lesson was the importance of checking the evidence before recommending action. For example, a contractor logging in after their recorded end date is a serious concern, but an approved contract extension must be ruled out before concluding that the access was unauthorised.

I also learned how to present technical access issues in a way that helps management understand the risks and recommended next steps.

## What I Would Improve

With additional evidence, I would:

- Confirm current account status and check approved contract extensions.
- Review detailed login and activity logs for accounts with Critical findings.
- Verify account ownership and business justification for privileged access.
- Check that recommended remediation actions were completed and documented.

These additional checks would help confirm the findings and provide stronger evidence that access risks had been addressed.
