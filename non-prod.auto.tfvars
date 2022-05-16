tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaaqitjiiy2rwxnzhpcdxlvzmxkl2x7ki6doky2jqptm7uhfz7u6gpa"
user_ocid = "ocid1.user.oc1..aaaaaaaaoplle5hawhuxfrbm6hywirvdgdqh56ff6u4wedw2qvz7nzdhzcka" 
private_key_path = "./terrafrom.pem"
fingerprint = "58:29:77:14:6d:c2:7b:2b:d8:d7:26:c6:99:6e:26:09"
region = "ap-mumbai-1"

root_compartment_variables = {
  c1 = { 
     compartment_name = "network_compartment"
     compartment_description = "Compartment for Network resources"
     }
#   c2 = { 
#      compartment_name = "ebs_compartment"
#      compartment_description = "Compartment for EBS resources"
#       }
#   c3 = { 
#      compartment_name = "peoplesoft_compartment"
#      compartment_description = "Compartment for PeopleSoft resources"
#       }
}

ebs_compartment_variables = {
  c1 = { 
     compartment_name = "ebs_apps_compartment"
     compartment_description = "Compartment for EBS Apps resources"
     }
  c2 = { 
     compartment_name = "ebs_db_compartment"
     compartment_description = "Compartment for EBS DB resources"
      }
  }

iam_groups = {
    iamg1 = { group_name = "group_test", group_desc = "group test", user_list = ["test", "test1"] }
    iamg2 = { group_name = "group_test1", group_desc = "group test1", user_list = ["test", "test1"] }
  }

iam_users = {
    test = {user_name = "test", user_desc = "user test"}
    test1 = {user_name = "test1", user_desc = "user test1"}
  }

policies_config = {
  default_compartment_id = "ocid1.tenancy.oc1..aaaaaaaaqitjiiy2rwxnzhpcdxlvzmxkl2x7ki6doky2jqptm7uhfz7u6gpa"
#   default_defined_tags   = "default_defined_tags"
#   default_freeform_tags  = "default_freeform_tags"
  policies = {
    policy_1 = {
      description    = "Test Policy 1"
      statements     = ["statement-1", "statement-2"]
      # version_date   = null
      compartment_id = "ocid1.tenancy.oc1..aaaaaaaaqitjiiy2rwxnzhpcdxlvzmxkl2x7ki6doky2jqptm7uhfz7u6gpa"
      # defined_tags   = "specific_defined_tags"
      # freeform_tags  = "specific_freeform_tags"
    }
    policy_2 = {
      description    = "Test Policy 2"
      statements     = ["statement-1"]
      # version_date   = null
      compartment_id = "ocid1.tenancy.oc1..aaaaaaaaqitjiiy2rwxnzhpcdxlvzmxkl2x7ki6doky2jqptm7uhfz7u6gpa"
      # defined_tags   = "specific_defined_tags"
      # freeform_tags  = "default_freeform_tags"
    }
  }
}