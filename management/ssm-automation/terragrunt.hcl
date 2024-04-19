include "root" {
  path = find_in_parent_folders()
}

dependency "Windows_Instance" {
  mock_outputs = {
    ec2_instance_id = "i-0d1eba4ec6db26094"
  }

  config_path = "../../compute/Windows_Instance/"
}

dependency "s3" {
  mock_outputs = {
    s3_bucket_id = "fake-s3-bucket-id"
  }

  config_path = "../../storage/s3/"
}

inputs = {
  instance_id  = dependency.Windows_Instance.outputs.ec2_instance_id
  s3_bucket_id = dependency.s3.outputs.s3_bucket_id
}