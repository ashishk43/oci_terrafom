variable "parent_ocid" {}
variable "compartment_variables" {type = map}

#child Compartment 
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