policies_config = {
  default_compartment_id = "ocid1.tenancy.oc1..aaaaaaaaqitjiiy2rwxnzhpcdxlvzmxkl2x7ki6doky2jqptm7uhfz7u6gpa"
  default_defined_tags   = { "Department" = "Define" }
  default_freeform_tags  = { "Department" = "freedom" }
  policies = {
    policy_1 = {
      description    = "Test Policy 1"
      statements     = ["statement-1", "statement-2"]
      version_date   = null
      compartment_id = "ocid1.tenancy.oc1..aaaaaaaaqitjiiy2rwxnzhpcdxlvzmxkl2x7ki6doky2jqptm7uhfz7u6gpa"
      defined_tags   = { "Department" = "policy1" }
      freeform_tags  = { "Department" = "policy1" }
    }
    policy_2 = {
      description    = "Test Policy 2"
      statements     = ["statement-1"]
      version_date   = null
      compartment_id = "ocid1.tenancy.oc1..aaaaaaaaqitjiiy2rwxnzhpcdxlvzmxkl2x7ki6doky2jqptm7uhfz7u6gpa"
      defined_tags   = { "Department" = "policy2" }
      freeform_tags  = { "Department" = "policy2" }
    }
  }
}