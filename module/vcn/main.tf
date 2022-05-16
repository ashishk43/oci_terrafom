resource "oci_core_vcn" "this" {
  for_each = var.vcn_config.vcn
  cidr_blocks    = [each.value.vnc_cidr_block]
  compartment_id = each.value.compartment_id
  display_name   = each.value.vcn_label_prefix == "none" ? each.value.vcn_display_name : "${each.value.vcn_label_prefix}-${each.value.vcn_display_name}"
  dns_label      = each.value.vcn_dns_label
  is_ipv6enabled = each.value.ipv6enabled

  freeform_tags = each.value.freeform_tags
  defined_tags = each.value.defined_tags
}

resource "oci_core_subnet" "tf_vcn_private_subnet"{
  # Required
  for_each = var.vcn_config.vcn
  compartment_id    = each.value.compartment_id
  vcn_id            = oci_core_vcn.this.[each.value.display_name].name
  cidr_block        = each.value.vnc_private_subnet_cidr_block

  # Optional
#   route_table_id    = module.vcn.nat_route_id
#   security_list_ids = [oci_core_security_list.tf_private_security_list.id]
#   display_name      = "private-subnet"
}

resource "oci_core_subnet" "tf_vcn_public_subnet"{
  # Required
  for_each = var.vcn_config.vcn
  compartment_id    = each.value.compartment_id
  vcn_id            = oci_core_vcn.this.[each.value.vcn_display_name].name
  cidr_block        = each.value.vnc_public_subnet_cidr_block

  # Optional
#   route_table_id    = module.vcn.ig_route_id
#   security_list_ids = [oci_core_security_list.tf_public_security_list.id]
#   display_name      = "public-subnet"
}