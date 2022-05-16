module "Compartment" {
    source = "./Compartment"
    parent_ocid           = var.tenancy_ocid
    root_compartment_variables = var.root_compartment_variables
    ebs_compartment_variables = var.ebs_compartment_variables
}

module "iam" {
    source = "./IAM"
    tenancy_ocid = var.tenancy_ocid
    iam_groups = var.iam_groups
    iam_users = var.iam_users
    policies_config = var.policies_config
}

module "oci_vcn" {
    source = "./module/vcn"
    vcn_config = var.vcn_config
}