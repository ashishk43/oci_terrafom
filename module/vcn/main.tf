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
  vcn_id            = oci_core_vcn.this[each.key].id
  cidr_block        = each.value.vnc_private_subnet_cidr_block

  # Optional
#   route_table_id    = module.vcn.nat_route_id
  security_list_ids = [oci_core_security_list.private_security_list[each.key].id]
  display_name      = "${each.value.vcn_display_name}-private-subnet"
}

resource "oci_core_subnet" "tf_vcn_public_subnet"{
  # Required
  for_each = var.vcn_config.vcn
  compartment_id    = each.value.compartment_id
  vcn_id            = oci_core_vcn.this[each.key].id
  cidr_block        = each.value.vnc_public_subnet_cidr_block

  # Optional
  route_table_id    = oci_core_route_table.this[each.key].id
  security_list_ids = [oci_core_security_list.public_security_list[each.key].id]
  display_name      = "${each.value.vcn_display_name}-public-subnet"
}

resource "oci_core_internet_gateway" "this" {
  for_each = var.vcn_config.vcn
  compartment_id    = each.value.compartment_id
  display_name   = "${each.value.vcn_display_name}-Internet Gateway"
  enabled        = true
  vcn_id         = oci_core_vcn.this[each.key].id
}

resource "oci_core_route_table" "this" {
  for_each = var.vcn_config.vcn
  display_name   = "${each.value.vcn_display_name}-Route Table"
  compartment_id    = each.value.compartment_id
  vcn_id         = oci_core_vcn.this[each.key].id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.this[each.key].id
  }
}

resource "oci_core_security_list" "private_security_list" {
  for_each = var.vcn_config.vcn
  display_name   = "${each.value.vcn_display_name}-private Security List"
  compartment_id    = each.value.compartment_id
  vcn_id         = oci_core_vcn.this[each.key].id

  # // allow outbound tcp traffic on all ports
  # egress_security_rules {
  #   for_each = length(each.value.private_security_list)
  #   a = each.value.private_security_list
  # }

    // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  // allow inbound ssh traffic
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }
}

resource "oci_core_security_list" "public_security_list" {
  for_each = var.vcn_config.vcn
  display_name   = "${each.value.vcn_display_name}-Public Security List"
  compartment_id    = each.value.compartment_id
  vcn_id         = oci_core_vcn.this[each.key].id

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  // allow inbound ssh traffic
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }
  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    protocol = 1
    source   = "0.0.0.0/0"

    icmp_options {
      type = 3
      code = 4
    }
  }

  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    protocol = "all"
    source   = "10.0.0.0/16"
  }
}

