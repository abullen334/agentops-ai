# GitHub Actions — OCI Terraform Provisioning

**Workflow:** `.github/workflows/terraform-provision.yml`  
**Deployment result:** No OCI VM created.

## Workflow intent
Support safe, manually initiated infrastructure validation and carefully gated provisioning while minimizing accidental spend or duplicate resources.

## Recorded safeguards
- `workflow_dispatch` manual invocation.
- Dry-run mode that validates plans without `terraform apply`.
- Test-mode retry-loop/availability-domain checks without creating a VM.
- Explicit dual confirmation for live provisioning.
- Approved-resource restrictions.
- OCI Python SDK instance-existence checks.
- Terraform state guard excluding data sources after commit `537dc14`.
- Capacity-aware retry/error classification and error summaries.

## Execution history
The supplied metadata lists **26 workflow runs**: **8 success, 17 failure, 1 unknown conclusion**. A successful workflow may only indicate dry-run or test-mode completion; it must **never** be counted as a successful deployment without resource evidence.

Six detailed logs were supplied for selected runs:
- `40505808646`
- `40605131971`
- `40605520714`
- `40608013894`
- `40609913890`
- `40611671411`

Links follow the form:
`https://github.com/abullen334/agentops-ai/actions/runs/<run-id>`

## Operational runbook
1. Review Terraform diff and the current managed-resource state.
2. Confirm OCI compartment, region, shape, subnet and budget implications.
3. Run dry-run validation first.
4. Inspect existing instances and boot volumes.
5. Only if explicitly approved, enter both live-provisioning confirmations.
6. Review the run log and resource inventory; do not infer deployment from exit status alone.
7. On capacity or ambiguous errors, stop and check for partial resources before retrying.

## Incident lessons
- `data.*` state entries are not managed VMs.
- Provider `Out of host capacity` errors represent failed allocation, not successful partial deployment.
- Availability-domain test loops validate workflow logic, not cloud capacity.

See [audit log](../implementation/implementation-audit-log.md) and [evidence index](../evidence/evidence-index.md).
