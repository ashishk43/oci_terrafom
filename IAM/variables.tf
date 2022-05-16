variable "iam_groups" {}
variable "iam_users" {}
variable "tenancy_ocid" {}
variable "policies_config" {
  type = object({
    default_compartment_id = string,
    default_defined_tags   = map(string),
    default_freeform_tags  = map(string),
    policies = map(object({
      compartment_id = string,
    #   defined_tags   = map(string),
    #   freeform_tags  = map(string),
      description    = string,
      statements     = list(string),
    #   version_date   = string
      })
    )
  })
}