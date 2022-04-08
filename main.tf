module "Compartment" {
    source = "./Compartment"
    parent_ocid           = var.tenancy_ocid
    compartment_variables = var.root_compartment_variables
}