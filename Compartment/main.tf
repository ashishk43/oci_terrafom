// Create Root Compartment
module "CreateRootCompartment" {
  source                = "../module/create-compartment"
  parent_ocid           = var.parent_ocid
  compartment_variables = var.root_compartment_variables
}

# locals {
#   ebs_root_compartment_id = [
#     for i in .module.CreateRootCompartment.instances : i.id if i.name == "network_compartment"
#   ]
# }

# module "CreateCompartmentEBS" {
#   source                ="../module/create-compartment"
#   parent_ocid           = module.CreateRootCompartment.
#   compartment_variables = var.ebs_compartment_variables
# }

output "test" {
  value = module.CreateRootCompartment[*]
}
