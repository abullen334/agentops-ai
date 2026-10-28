# Terraform Configuration — OCI

**Status:** Terraform configuration exists in Git history; this document describes the recorded design, not a source-code-level audit.

## Repository location
`infrastructure/terraform/` (supported by commit-file history).

## Recorded versions
- Terraform CLI: `1.17.0`
- OCI provider: `7.32.0`

## Infrastructure responsibilities
- OCI provider authentication and regional configuration.
- Data lookups for availability domains and Ubuntu ARM64 images.
- A1 Flex instance resource, constrained to approved shape/settings.
- OCI Object Storage remote state backend.
- Input variables for compartment, subnet, availability domain index and SSH public key.

## Safe local validation
From `infrastructure/terraform/`:
```bash
terraform fmt -check -recursive
terraform init
terraform validate
terraform plan -out=tfplan
terraform show tfplan
terraform state list
```
`terraform plan` does not create resources. `terraform apply` is intentionally omitted from the routine validation sequence.

## State guard
Earlier logic treated a nonempty `terraform state list` as evidence of a managed resource. This is incorrect when the state contains only data sources:
```text
data.oci_core_images.ubuntu_arm64
data.oci_core_images.ubuntu_minimal_arm64
data.oci_identity_availability_domains.agentops
```
Commit `537dc14` changed the guard to exclude `data.*` entries. Managed resource addresses must still block unsafe duplicate provisioning.

## Safety requirements
- Preserve approval/dual-confirmation checks.
- Check existing instances through OCI as well as Terraform state.
- Prevent unintended destroy and limit permitted resource changes.
- Stop on ambiguous provider errors and inspect partial resources.
- Avoid `terraform state rm`, `-auto-approve`, or forceful replacement without a reviewed change plan.
- Keep `.terraform/`, state, secret variable files, and plan artifacts out of Git.

## Verification gaps
The exact current contents of `main.tf`, `variables.tf`, backend configuration, and workflow source should be reviewed against the current repository before copying commands into a live apply run.
