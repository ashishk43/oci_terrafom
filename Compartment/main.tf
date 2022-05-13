// Create Root Compartment
module "CreateRootCompartment" {
  source                = "../module/create-compartment"
  parent_ocid           = var.parent_ocid
  compartment_variables = var.root_compartment_variables
}