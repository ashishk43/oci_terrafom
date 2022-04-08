// Create Root Compartment
module "CreateRootCompartment" {
  source                = "../module/create-compartment"
  parent_ocid           = var.tenancy_ocid
  compartment_variables = var.root_compartment_variables
}

locals {
  ebs_root_compartment_id = [
    for i in module.CreateRootCompartment.compartmentinfo : i.id if i.name == "ebs_compartment"
  ]
}

module "CreateCompartmentEBS" {
  source                ="../module/create-compartment"
  parent_ocid           = local.ebs_root_compartment_id[0]
  compartment_variables = var.ebs_compartment_variables
}