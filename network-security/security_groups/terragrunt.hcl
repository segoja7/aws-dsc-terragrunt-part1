include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  mock_outputs = {
    vpc_id = "fake-vpc-id"
  }

  #    skip_outputs = true
  config_path = "../vpc/"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
}

