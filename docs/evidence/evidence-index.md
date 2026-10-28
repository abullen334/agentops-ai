# AgentOps AI — Evidence Index

**As of:** 2026-10-28  
**Purpose:** Trace implementation statements to supplied records without publishing raw secrets.

| Evidence ID | Source | Scope | Confidence |
|---|---|---|---|
| EV-001 | `commits.tsv` | 28 Git commits with SHA/date/message | Supplied export |
| EV-002 | `commit-files.txt` | Changed-file history by commit | Supplied export |
| EV-003 | `workflow-runs.json` | 26 GitHub Actions run records | Supplied export |
| EV-004 | `40505808646.log` | Selected workflow execution log | Supplied |
| EV-005 | `40605131971.log` | Selected workflow execution log | Supplied |
| EV-006 | `40605520714.log` | Selected workflow execution log | Supplied |
| EV-007 | `40608013894.log` | State-guard incident evidence | Supplied |
| EV-008 | `40609913890.log` | Live provisioning / capacity evidence | Supplied |
| EV-009 | `40611671411.log` | Later availability-domain attempt | Supplied |
| EV-010 | Project-owner statement | Zero VMs created manually or via GitHub Actions | Explicitly confirmed |
| EV-011 | OCI live inventory | Instances and boot volumes | PENDING |
| EV-012 | Current Terraform state listing | Managed resources vs data sources | PENDING fresh snapshot |
| EV-013 | Current repository file review | Full Terraform/workflow configuration | PENDING |

## Workflow run links
- [40505808646](https://github.com/abullen334/agentops-ai/actions/runs/40505808646)
- [40605131971](https://github.com/abullen334/agentops-ai/actions/runs/40605131971)
- [40605520714](https://github.com/abullen334/agentops-ai/actions/runs/40605520714)
- [40608013894](https://github.com/abullen334/agentops-ai/actions/runs/40608013894)
- [40609913890](https://github.com/abullen334/agentops-ai/actions/runs/40609913890)
- [40611671411](https://github.com/abullen334/agentops-ai/actions/runs/40611671411)

## Key commit links
- [537dc14 — exclude Terraform data sources](https://github.com/abullen334/agentops-ai/commit/537dc14d025ab2133d8c22bbbee0812d944207d0)
- [7ca5df6 — error summary](https://github.com/abullen334/agentops-ai/commit/7ca5df6d9601081d18bb747fa237480eaa584fc4)
- [acdd53e — capacity-aware provisioning](https://github.com/abullen334/agentops-ai/commit/acdd53e9a4d345e00df0fab990af198b9562a72f)

## Evidence interpretation
A `success` workflow conclusion may represent validation only. Host-capacity errors show unsuccessful instance allocation. Zero-VM status is owner-confirmed and should be reconciled against a fresh OCI inventory when access is available.
