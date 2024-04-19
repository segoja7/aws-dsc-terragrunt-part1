include "root" {
  path = find_in_parent_folders()
}


inputs = {
  aws_region       = "us-east-1"
  environment_name = "dsc-windows-vpc"
  vpc_cidr         = "172.16.0.0/16"
}