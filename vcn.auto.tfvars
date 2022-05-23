vcn_config = {
  vcn = {
    vcn_1 = {
      vcn_label_prefix = "Test"  
      vcn_display_name = "vcn_test_1"
      vcn_dns_label    = "Test vcn 1"
      ipv6enabled = "false"
      compartment_id = "ocid1.tenancy.oc1..aaaaaaaaqitjiiy2rwxnzhpcdxlvzmxkl2x7ki6doky2jqptm7uhfz7u6gpa"
      vnc_cidr_block = "10.0.0.0/16"
      vnc_private_subnet_cidr_block = "10.0.1.0/24"
      vnc_public_subnet_cidr_block = "10.0.0.0/24"
      defined_tags   = { "Department" = "vcn_1" }
      freeform_tags  = { "Department" = "vcn_1" }
    }
    vcn_2 = {
      vcn_label_prefix = "Prod"  
      vcn_display_name = "vcn_test_2"
      vcn_dns_label    = "Test vcn 2"
      ipv6enabled = "false"
      compartment_id = "ocid1.tenancy.oc1..aaaaaaaaqitjiiy2rwxnzhpcdxlvzmxkl2x7ki6doky2jqptm7uhfz7u6gpa"
      vnc_cidr_block = "10.0.1.0/16"
      vnc_private_subnet_cidr_block = "10.0.1.0/24"
      vnc_public_subnet_cidr_block = "10.0.0.0/24"
      defined_tags   = { "Department" = "vcn_2" }
      freeform_tags  = { "Department" = "vcn_2" }
    }
  }
}