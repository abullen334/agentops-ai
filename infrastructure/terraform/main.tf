
# Look up Ubuntu 24.04 ARM64 images compatible with A1 Flex.
data "oci_core_images" "ubuntu_arm64" {
  compartment_id           = var.compartment_id
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "24.04"
  shape                    = var.instance_shape

  sort_by    = "TIMECREATED"
  sort_order = "DESC"
}
output "available_ubuntu_images" {
  value = [
    for image in data.oci_core_images.ubuntu_arm64.images : {
      name = image.display_name
      id   = image.id
    }
  ]
}
data "oci_core_images" "ubuntu_minimal_arm64" {
  compartment_id           = var.compartment_id
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "24.04 Minimal"
  shape                    = var.instance_shape

  sort_by    = "TIMECREATED"
  sort_order = "DESC"
}

output "available_ubuntu_minimal_images" {
  value = [
    for image in data.oci_core_images.ubuntu_minimal_arm64.images : {
      name = image.display_name
      id   = image.id
    }
  ]
}
locals {
  ubuntu_image_id = "ocid1.image.oc1.iad.aaaaaaaa6o52ajhkewa2syfadrxel5b7tfwi5qdm45gl4ykwbqut25tvdxrq"
}
data "oci_identity_availability_domains" "agentops" {
  compartment_id = var.compartment_id
}

output "availability_domains" {
  value = [
    for ad in data.oci_identity_availability_domains.agentops.availability_domains :
    ad.name
  ]
}
locals {
  selected_availability_domain = data.oci_identity_availability_domains.agentops.availability_domains[var.availability_domain_index].name
}

resource "oci_core_instance" "agentops" {
  compartment_id      = var.compartment_id
  availability_domain = local.selected_availability_domain
  display_name        = var.instance_name
  shape               = var.instance_shape

  shape_config {
    ocpus         = var.instance_ocpus
    memory_in_gbs = var.instance_memory_gb
  }

  source_details {
    source_type             = "image"
    source_id               = local.ubuntu_image_id
    boot_volume_size_in_gbs = var.boot_volume_gb
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    assign_public_ip = true
  }

  metadata = {
    ssh_authorized_keys = trimspace(file("${path.module}/agentops_oci.pub"))
  }

  freeform_tags = {
    Project   = "AgentOps-AI"
    ManagedBy = "Terraform"
  }

  lifecycle {
    prevent_destroy = true

    precondition {
      condition = (
        var.instance_shape == "VM.Standard.A1.Flex" &&
        var.instance_ocpus == 2 &&
        var.instance_memory_gb == 12 &&
        var.boot_volume_gb == 50
      )
      error_message = "Instance specifications exceed the approved AgentOps AI configuration."
    }
  }
}
