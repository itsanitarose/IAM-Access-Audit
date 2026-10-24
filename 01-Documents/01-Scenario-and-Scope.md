# 01 — Scenario and Scope

**Project:** Northwind Health | IAM User Access Review  
**Assessment Area:** Identity and Access Management (IAM)

---

## 1. Business Context

Northwind Health is a US-based healthcare SaaS provider supporting approximately 400 clinics with a workforce of 120 employees. The organisation handles electronic protected health information (ePHI), making secure access management essential to protecting patient information and maintaining business continuity.

The access review focuses on potential weaknesses in employee and contractor offboarding, privileged access, shared accounts and account ownership.

## 2. Assessment Objectives

The review aims to:

- Identify inappropriate, excessive or insufficiently justified user access.
- Assess security risks associated with account lifecycle and access governance.
- Prioritise findings based on severity and potential business impact.
- Recommend corrective actions and preventive IAM controls.

## 3. Scope of Review

Seven accounts were assessed against the supplied access records.

| Account | Review Focus |
|---|---|
| `skim` | Post-termination login activity |
| `treyes` | Contractor Admin access after contract end |
| `testadmin` | Orphaned administrative account |
| `support-shared` | Shared credentials and lack of accountability |
| `lgrant` | Account inactivity during extended leave |
| `pnair` | Finance access requiring business-need validation |
| `dholt` | Admin privileges requiring justification |

The assessment covers Joiner, Mover and Leaver (JML) processes, privileged access, least privilege, account ownership and periodic access reviews.

## 4. Assessment Approach

| Stage | Activity |
|---|---|
| **Review** | Examine account details, assigned roles, employment status and login activity. |
| **Identify** | Highlight access discrepancies and control weaknesses. |
| **Assess** | Evaluate severity, privilege level and potential business impact. |
| **Prioritise** | Determine which findings require immediate attention. |
| **Recommend** | Define remediation actions and preventive controls. |
| **Report** | Present findings and recommendations to IT management. |

---

**Project Output:** A structured IAM access review supported by an account inventory, risk assessment, findings register, remediation plan and executive summary.
