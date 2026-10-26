
variable "oci_region" {
  description = "OCI region for AgentOps AI infrastructure"
  type        = string
  default     = "us-ashburn-1"

  validation {
    condition     = var.oci_region == "us-ashburn-1"
    error_message = "AgentOps AI provisioning is restricted to OCI US East (Ashburn)."
  }
}

variable "compartment_id" {
  description = "OCI compartment for AgentOps AI infrastructure"
  type        = string

  default = "ocid1.compartment.oc1..aaaaaaaawv5hkgwxbpwsefyyyojdfaxjgjk6a4l7bcrwbgclfcoq2czecheq"
}

variable "subnet_id" {
  description = "Existing OCI subnet for the AgentOps AI VM"
  type        = string

  default = "ocid1.subnet.oc1.iad.aaaaaaaaigsbyivzxso43aerv32r7cfpyky6rsbepwkwjm52tpbdmyae777a"
}

variable "instance_name" {
  description = "Name of the AgentOps AI compute instance"
  type        = string
  default     = "agentops-ai"
}

variable "instance_shape" {
  description = "OCI Always Free ARM compute shape"
  type        = string
  default     = "VM.Standard.A1.Flex"

  validation {
    condition     = var.instance_shape == "VM.Standard.A1.Flex"
    error_message = "Only the approved Always Free ARM shape is permitted."
  }
}

variable "instance_ocpus" {
  description = "Number of ARM OCPUs"
  type        = number
  default     = 2

  validation {
    condition     = var.instance_ocpus == 2
    error_message = "AgentOps AI is configured for exactly 2 OCPUs."
  }
}

variable "instance_memory_gb" {
  description = "Instance memory in GB"
  type        = number
  default     = 12

  validation {
    condition     = var.instance_memory_gb == 12
    error_message = "AgentOps AI is configured for exactly 12 GB RAM."
  }
}

variable "boot_volume_gb" {
  description = "Boot volume size in GB"
  type        = number
  default     = 50

  validation {
    condition     = var.boot_volume_gb == 50
    error_message = "AgentOps AI is restricted to a 50 GB boot volume."
  }
}
variable "availability_domain_index" {
  description = "OCI availability domain index (0, 1, or 2)"
  type        = number
  default     = 0

  validation {
    condition     = contains([0, 1, 2], var.availability_domain_index)
    error_message = "Availability domain index must be 0, 1, or 2."
  }
}
