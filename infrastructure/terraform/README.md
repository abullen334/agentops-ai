
# AgentOps AI Infrastructure

Terraform configuration for Oracle Cloud Infrastructure.

Target:
- Region: us-ashburn-1
- Compartment: agentops-ai
- Shape: VM.Standard.A1.Flex
- OCPUs: 2
- Memory: 12 GB
- OS: Ubuntu 24.04 ARM64

Provisioning will be automated using GitHub Actions.

Terraform state and OCI credentials must never be committed to this repository.
