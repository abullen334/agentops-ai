# OCI Setup — AgentOps AI

**Current status:** Account/network/storage setup reported; **zero compute VMs deployed**.

## Target configuration
| Setting | Value / status |
|---|---|
| Cloud | Oracle Cloud Infrastructure |
| Region | US East (Ashburn), `us-ashburn-1` |
| Compartment | `agentops-ai` (reported) |
| Network | VCN `10.0.0.0/24`, public subnet (reported) |
| State storage | OCI Object Storage bucket (reported) |
| Compute shape | `VM.Standard.A1.Flex` |
| Requested size | 2 OCPUs, 12 GB RAM |
| Compute provisioning | BLOCKED; no instance exists |

## Reproducible setup checklist
1. Sign in to OCI and select Ashburn.
2. Confirm the `agentops-ai` compartment and its IAM policies.
3. Confirm VCN, subnet, route table, security list/NSG and internet gateway.
4. Confirm Object Storage bucket for Terraform state, access permissions and versioning policy.
5. Configure OCI API authentication securely, outside version control.
6. Verify compartment/region identifiers match Terraform variables.
7. Use `terraform init`, `terraform fmt -check`, `terraform validate`, then `terraform plan` before any authorized apply.
8. Inspect OCI instance and boot-volume inventory and Terraform state before retrying provisioning.

## Security precautions
Never commit API private keys, OCI credentials, Terraform state, generated plan files containing secrets, or unredacted CI logs. Limit ingress to required ports and sources. A public subnet alone does not establish a reachable or secure service.

## Validation commands
```bash
oci iam availability-domain list --compartment-id "$OCI_TENANCY_OCID"
oci compute instance list --compartment-id "$OCI_COMPARTMENT_OCID" --region us-ashburn-1
oci bv boot-volume list --compartment-id "$OCI_COMPARTMENT_OCID" --availability-domain "$OCI_AD_NAME" --region us-ashburn-1
```
These commands are **instructions**, not claims they were run. Verify the relevant availability domain and avoid sharing full resource identifiers publicly.

## Known blocker
OCI returned `500-InternalError, Out of host capacity` for selected live A1 provisioning attempts. See [capacity troubleshooting](../troubleshooting/oci-capacity-issues.md).
