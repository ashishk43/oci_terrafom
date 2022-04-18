tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaa3cu5bpzzmpaanzgzzih72p7gjg4bsm3fkg44gaiqkojigmh74w5q"
user_ocid = "ocid1.user.oc1..aaaaaaaaconasvqbzmsucnbpt43uiy7uti26ljjjrmyjhv6h76nfsffme4sa" 
private_key_path = "./terrafrom.pem"
fingerprint = "58:29:77:14:6d:c2:7b:2b:d8:d7:26:c6:99:6e:26:09"
region = "eu-frankfurt-1"

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