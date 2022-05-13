locals {

  # Create a list of maps, containing unique group name/user name combinations
  iam_group_users = flatten([
    for group, group_data in var.iam_groups : [
      for user in group_data.user_list : {
        group_name = group
        user_name = user
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
    for_each = toset(local.iam_group_users)
    group_id = oci_identity_group.this[each.value.group_name].id
    user_id = oci_identity_user.this[each.value.user_name].id
}