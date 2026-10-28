# OCI A1 Flex Capacity Troubleshooting

**Incident:** OCI compute allocation failed during live Terraform provisioning.  
**Confirmed outcome:** No VM was created manually or by GitHub Actions.

## Symptoms
Selected logs report:
```text
Error: 500-InternalError, Out of host capacity.
Service: Core Instance
Operation Name: LaunchInstance
with oci_core_instance.agentops
```
The error is distinct from the earlier Terraform state-guard false positive.

## Timeline and distinctions
1. Dry-run and availability-domain test-mode paths validated workflow logic; they did **not** allocate compute.
2. An overly broad state guard initially blocked an attempt because it counted `data.*` entries.
3. Commit `537dc14` corrected the guard.
4. Later live attempts reached `LaunchInstance` and failed with host-capacity errors. Selected evidence includes AD-1 and AD-2 attempts; do not assume all domains are continuously unavailable.
5. The project owner confirmed no VM was created through either manual or automated attempts.

## Safe diagnosis
```bash
cd infrastructure/terraform
terraform state list
terraform plan
```
Check OCI Console / CLI for existing instances and boot volumes in the correct compartment and availability domains. Review current free-tier eligibility and capacity without assuming a zero-cost outcome for alternate shapes.

## Options
- Retry a different availability domain **only after** inspecting state and inventory and receiving explicit authorization.
- Retry later, with bounded attempts rather than uncontrolled loops.
- Consider a smaller eligible A1 configuration, subject to OCI capacity and workload requirements.
- Continue local Docker Compose development.
- Record a cloud fallback decision before moving to another provider.

## Avoid
Do not disable guards, repeatedly force apply, delete state to bypass errors, or claim a successful deployment based on a passing test workflow.

## Resolution status
**OPEN / BLOCKED.** Compute deployment deferred; application development can proceed locally.
