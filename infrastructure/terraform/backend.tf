
terraform {
  backend "oci" {
    bucket    = "agentops-terraform-state"
    namespace = "idwywur705au"
    region    = "us-ashburn-1"
    key       = "agentops-ai/terraform.tfstate"
  }
}
