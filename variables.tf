variable "tenancy_ocid" {
}
variable "user_ocid" {
}
variable "private_key_path" {
}
variable "fingerprint" {
}
variable "region" {    
}
variable "root_compartment_variables" {}
variable "ebs_compartment_variables" {}
variable "iam_groups" {}
variable "iam_users" {}
variable "policies_config" {
  type = object({
    default_compartment_id = string,
    default_defined_tags   = map(string),
    default_freeform_tags  = map(string),
    policies = map(object({
      compartment_id = string,
      defined_tags   = map(string),
      freeform_tags  = map(string),
      description    = string,
      statements     = list(string),
      version_date   = string
      })
    )
  })
}