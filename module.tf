module "first-vm"{
  source = "../tera-demo/"
  region          = "us-central1"
  gcp_project     = "practice-project-305403"
  name            = "sushant"
  subnet_cidr     = "10.10.0.0/24"
  instance_name   = "sushant-1"
  my_inst_type    = "f1-micro"
  subnet_name     = "sushant-subnet"
  subnet_region   = "us-central1"

}
/*
module "second-vm"{
  source = "../Terraform-poc/"
  //region          = "us-central1"
  //gcp_project     = "practice-project-305403"
  //name            = "sushant"
  //subnet_cidr     = "10.20.0.0/24"
  instance_name   = "sushant-2"
  //my_inst_type    = "f1-micro"
  //subnet_name     = "sushant-subnet"
  //subnet_region   = "us-central1"



}
*/
