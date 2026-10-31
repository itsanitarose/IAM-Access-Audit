# 01: Scenario and Scope

**Case Study:** Northwind Health | IAM User Access Audit  
**Scenario date:** 5 October 2026

## 1. The Request

Northwind Health is a fictional, 120-person US healthcare SaaS company handling electronic protected health information (ePHI) for approximately 400 clinics.

The manager requests a reconciliation of patient administration portal accounts against HR records:

> “We've never properly reconciled the patient admin portal against HR. Here are both exports. Tell me what's wrong, what to fix first, and how we stop it happening again.”

## 2. Assessment Objectives

- Identify inappropriate, excessive, or insufficiently justified access.
- Prioritise findings by severity and potential business impact.
- Recommend corrective actions and controls to prevent recurrence.

## 3. Scope

Review seven patient administration portal accounts against five supplied HR records, covering:

- Employment status, contract end dates, and recorded login activity.
- Assigned roles and business justification.
- Account ownership, shared credentials, and credential storage.
- Account inactivity and access requirements during extended leave.

The technical work covers selected account and directory role changes in a Microsoft Entra ID test environment using Microsoft Graph PowerShell.

Validation includes account-state checks, directory role membership checks, and a reconciliation rerun.

## 4. Deliverables

| Deliverable | Contents |
|---|---|
| User Access Inventory | HR records, portal accounts, and reconciliation observations |
| Access Risk Methodology | Criteria for severity and prioritisation |
| Findings and Risk Register | Account issues, risks, severity, recommended actions, and first priority |
| Remediation and Preventive Controls | Corrective actions, implementation status, and preventive recommendations |
| Executive Summary | Findings and priorities for the IT manager, within 100 words |
| Implementation and Test Evidence | PowerShell scripts, account and role verification, and reconciliation results |

---

[Back to Project Overview](../README.md)
