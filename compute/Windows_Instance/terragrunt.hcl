include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  mock_outputs = {
    vpc_id             = "fake-vpc-id"
    subnet_ids         = ["sg-fake1", "sg-fake2"]
    public_subnet_ids  = ["subnet-fake1"]
    availability_zones = ["az1"]
  }

  #    skip_outputs = true
  config_path = "../../network-security/vpc/"
}

dependency "security_groups" {
  mock_outputs = {
    id_securitygroup = "fake-securitygroup-id"

  }

  #    skip_outputs = true
  config_path = "../../network-security/security_groups/"
}

inputs = {
  vpc_id             = dependency.vpc.outputs.vpc_id
  subnet_ids         = dependency.vpc.outputs.subnet_ids
  public_subnet_ids  = dependency.vpc.outputs.public_subnet_ids
  availability_zones = dependency.vpc.outputs.availability_zones
  security_group_id  = dependency.security_groups.outputs.id_securitygroup
}

