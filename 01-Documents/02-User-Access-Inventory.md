# 02: User Access Inventory

**Project:** Northwind Health | IAM User Access Review  
**Scenario date:** 5 October 2026

## 1. Access Reconciliation Overview

This review compares the supplied HR records with patient administration portal accounts to identify mismatches between employment status and system access.

It covers five named users and two additional portal accounts.

## 2. HR Records

| Employee / Contractor | ID | Status | End Date | Department |
|---|---|---|---|---|
| Sarah Kim | E1021 | Terminated | 15 Aug 2026 | Customer Success |
| Tom Reyes | C3004 | Contractor | 31 Jul 2026 | Engineering |
| Priya Nair | E1033 | Active | Not provided | Finance |
| Dan Holt | E1040 | Active | Not provided | Engineering |
| Lisa Grant | E1052 | Active, on leave since May | Not provided | HR |

## 3. Patient Administration Portal Accounts

| Username | Assigned Role | Last Login | Account Notes |
|---|---|---|---|
| `skim` | Support Agent | 2 Sep 2026 | None provided |
| `treyes` | Admin | 28 Sep 2026 | None provided |
| `pnair` | Read-only | 1 Oct 2026 | None provided |
| `dholt` | Admin | 2 Oct 2026 | None provided |
| `lgrant` | Support Agent | 11 May 2026 | None provided |
| `support-shared` | Support Agent | 3 Oct 2026 | Shared login; password stored in team wiki |
| `testadmin` | Admin | 20 Nov 2025 | Created by an engineer who has since left |

## 4. Reconciliation Results

| Account | Observation |
|---|---|
| `skim` | Employee terminated on 15 Aug; portal login recorded on 2 Sep |
| `treyes` | Contract ended on 31 Jul; Admin login recorded on 28 Sep; contract extension requires confirmation |
| `testadmin` | Orphaned Admin account created by an engineer who has left; last login recorded on 20 Nov 2025 |
| `support-shared` | Shared login with its password stored in a team wiki; actions cannot be reliably attributed to an individual |
| `lgrant` | Employee on extended leave; no recorded login since 11 May |
| `pnair` | Finance employee with read-only patient administration portal access; business need requires confirmation |
| `dholt` | Engineering employee with Admin access; justification requires confirmation and documentation |

## 5. Inventory Summary

Seven accounts require action or confirmation across offboarding, contractor expiry, orphaned accounts, shared credentials, extended leave, and access justification.

Severity ratings, priorities, and corrective actions are recorded in the [Findings and Risk Register](04-Access-Findings-and-Risk-Register.md).

---

[Back to Project Overview](../README.md)
