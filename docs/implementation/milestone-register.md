# AgentOps AI — Infrastructure Milestone Register

**Status date:** 2026-10-28. IDs match the [audit log](implementation-audit-log.md). `REPORTED` is not independent verification.

| ID | Milestone | Status |
|---|---|---|
| INF-001 | Repository created and initial push | REPORTED |
| INF-002 | Domain registration and DNS setup | REPORTED |
| INF-003 | OCI tenancy and compartment | REPORTED |
| INF-004 | VCN and public subnet | REPORTED |
| INF-005 | Object Storage remote state initialization | OBSERVED / REPORTED |
| INF-006 | Terraform and OCI provider configuration | OBSERVED / REPORTED |
| INF-007 | GitHub Actions provisioning workflow | OBSERVED |
| INF-008 | Approved instance shape and safeguards | REPORTED; source review pending |
| INF-009 | OCI SDK instance existence checks | OBSERVED in workflow history |
| INF-010 | Plan safety and dual confirmation | OBSERVED |
| INF-011 | Availability-domain test-mode validation | OBSERVED; no apply |
| INF-012 | Initial live provisioning attempt | FAILED; original cause not fully verified |
| INF-013 | False-positive Terraform state guard | OBSERVED |
| INF-014 | State contained `data.*` sources | OBSERVED in supplied output |
| INF-015 | State guard corrected | OBSERVED via commit and later workflow behavior |
| INF-016 | OCI host-capacity failure | OBSERVED; FAILED |
| INF-017 | No instance / boot volume after failure | REPORTED; inventory pending |
| INF-018 | Manual configuration evaluated | NOT DEPLOYED |
| INF-019 | Pause OCI compute; proceed locally | DECIDED |

## Next proposed milestones
| ID | Milestone | Acceptance evidence |
|---|---|---|
| APP-001 | Confirm application domain and initial stories | Approved scope and acceptance criteria |
| APP-002 | Create multi-module Gradle foundation | Build/test commands pass locally |
| APP-003 | Add local PostgreSQL and Liquibase | Clean migration against fresh database |
| APP-004 | Implement first secured REST endpoint | Automated integration test |
| APP-005 | Add CI build/test pipeline | Successful workflow linked to commit |
| INF-020 | Reassess cloud deployment | Recorded decision, cost estimate and safety checks |

Milestones APP-001 onward are **proposed**, not completed.
