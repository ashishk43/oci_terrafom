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