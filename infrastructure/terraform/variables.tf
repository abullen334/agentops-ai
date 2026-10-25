
variable "oci_region" {
  description = "OCI region for AgentOps AI infrastructure"
  type        = string
  default     = "us-ashburn-1"

  validation {
    condition     = var.oci_region == "us-ashburn-1"
    error_message = "AgentOps AI provisioning is restricted to OCI US East (Ashburn)."
  }
}
