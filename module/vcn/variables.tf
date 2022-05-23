variable "vcn_config" {
  type = object({
    vcn = map(object({
      vcn_label_prefix = string,  
      compartment_id = string,
      vcn_display_name = string,
      vcn_dns_label = string,
      ipv6enabled = string,
      vnc_cidr_block = string,
      vnc_private_subnet_cidr_block = string,
      vnc_public_subnet_cidr_block = string,
      defined_tags   = map(string),
      freeform_tags  = map(string),
      private_security_list = list(string)
      })
    )
  })
}