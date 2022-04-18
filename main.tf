module "Compartment" {
    source = "./Compartment"
    parent_ocid           = var.tenancy_ocid
    root_compartment_variables = var.root_compartment_variables
    ebs_compartment_variables = var.ebs_compartment_variables
}