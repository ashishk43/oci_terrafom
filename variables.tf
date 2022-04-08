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

root_compartment_variables = {
  c1 = { 
     compartment_name = "network_compartment"
     compartment_description = "Compartment for Network resources"
     }
  c2 = { 
     compartment_name = "ebs_compartment"
     compartment_description = "Compartment for EBS resources"
      }
  c3 = { 
     compartment_name = "peoplesoft_compartment"
     compartment_description = "Compartment for PeopleSoft resources"
}