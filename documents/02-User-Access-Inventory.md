# 02 — User Access Inventory

**Project:** Northwind Health | IAM User Access Review
**Document Reference:** IAM-DOC-02-UI
**Review Date:** 5 October 2026

---

## 1. Access Reconciliation Overview

The review compares Northwind Health's HR export with its patient administration portal user list to identify discrepancies between workforce status and application access.

The reconciliation covers five named users and two additional application accounts.

## 2. HR Records

| Employee / Contractor | ID    | Status                      | End Date    | Department       |
| --------------------- | ----- | --------------------------- | ----------- | ---------------- |
| Sarah Kim             | E1021 | Terminated                  | 15 Aug 2026 | Customer Success |
| Tom Reyes             | C3004 | Contractor                  | 31 Jul 2026 | Engineering      |
| Priya Nair            | E1033 | Active                      | —           | Finance          |
| Dan Holt              | E1040 | Active                      | —           | Engineering      |
| Lisa Grant            | E1052 | Active — on leave since May | —           | HR               |

## 3. Patient Admin Portal Access Register

| Username         | Assigned Role | Last Login  | Account Notes                              |
| ---------------- | ------------- | ----------- | ------------------------------------------ |
| `skim`           | Support Agent | 2 Sep 2026  | —                                          |
| `treyes`         | Admin         | 28 Sep 2026 | —                                          |
| `pnair`          | Read-only     | 1 Oct 2026  | —                                          |
| `dholt`          | Admin         | 2 Oct 2026  | —                                          |
| `lgrant`         | Support Agent | 11 May 2026 | —                                          |
| `support-shared` | Support Agent | 3 Oct 2026  | Shared login; password stored in team wiki |
| `testadmin`      | Admin         | 20 Nov 2025 | Created by an engineer who has since left  |

## 4. Reconciliation Results

| Account          | HR / Portal Comparison                            | Review Observation                                     |
| ---------------- | ------------------------------------------------- | ------------------------------------------------------ |
| `skim`           | Terminated 15 Aug; portal login 2 Sep             | Post-termination activity                              |
| `treyes`         | Contract end 31 Jul; Admin login 28 Sep           | Post-contract-end privileged activity                  |
| `pnair`          | Active Finance employee; read-only role           | Access requires routine validation                     |
| `dholt`          | Active Engineering employee; Admin role           | Privileged access justification requires review        |
| `lgrant`         | Active employee on leave; last login 11 May       | Leave-of-absence access review                         |
| `support-shared` | No individual HR identity associated with account | Shared access and credential accountability concern    |
| `testadmin`      | Account creator has departed                      | Account ownership and continued purpose require review |

## 5. Inventory Summary

The reconciliation identifies access governance concerns involving:

- **Offboarding:** Login activity recorded after employment or contract end dates.
- **Privileged access:** Admin accounts requiring business justification and ownership validation.
- **Account accountability:** Shared credentials and an administrative account linked to a departed creator.
- **Access recertification:** Review of access appropriateness for active employees, including leave arrangements.

These observations form the evidence base for the access risk assessment and findings register.

---

