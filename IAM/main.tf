locals {

  # Create a list of maps, containing unique group name/user name combinations
  iam_group_users = flatten([
    for group, group_data in var.iam_groups : [
      for user in group_data.user_list : {
        group_name = group
        user_name = user
        mapping = "${group}-${user}"
      }
    ]  
  ])

}

# Iterate iam_groups, to create a collection of group resources
resource "oci_identity_group" "this" {
  for_each       = var.iam_groups
  compartment_id = var.tenancy_ocid
  name           = each.value.group_name
  description    = each.value.group_desc
}

# Iterate iam_users, to create a colelction of user resources
resource "oci_identity_user" "this" {
  for_each       = var.iam_users
  compartment_id = var.tenancy_ocid
  name           = each.value.user_name
  description    = each.value.user_desc
}

# Iterate the mapping of users that are members of each group to create the association
resource "oci_identity_user_group_membership" "test_user_group_membership" {
    for_each = {for users in local.iam_group_users: users.mapping =>  users}
    group_id = oci_identity_group.this[each.value.group_name].id
    user_id = oci_identity_user.this[each.value.user_name].id
}

#################
# Policy
#################
# default values
locals {
default_policy = {
    tenancy_compartment_id = var.tenancy_ocid
    description            = "OCI Policy created with the OCI Core IAM Policies Module"
    statements             = []
    name                   = "OCI-Policy"
    defined_tags           = {}
    freeform_tags          = { "Department" = "Default" }
    version_date           = formatdate("YYYY-MM-DD", timestamp())
  }
}

resource "oci_identity_policy" "policies" {
  for_each = var.policies_config != null ? (var.policies_config.policies != null ? var.policies_config.policies : {}) : {}
  #Required
  compartment_id = each.value.compartment_id != null ? each.value.compartment_id : (var.policies_config.default_compartment_id != null ? var.policies_config.default_compartment_id : local.default_policy.compartment_id)
  description    = each.value.description != null ? each.value.description : local.default_policy.description
  name           = each.key
  statements     = each.value.statements

  #Optional
  defined_tags  = each.value.defined_tags != null ? each.value.defined_tags : (var.policies_config.default_defined_tags != null ? var.policies_config.default_defined_tags : local.default_policy.defined_tags)
  freeform_tags = each.value.freeform_tags != null ? each.value.freeform_tags : (var.policies_config.default_freeform_tags != null ? var.policies_config.default_freeform_tags : local.default_policy.freeform_tags)
  version_date  = each.value.version_date != null ? each.value.version_date : local.default_policy.version_date
}