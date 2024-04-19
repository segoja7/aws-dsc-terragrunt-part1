# stage/terragrunt.hcl
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "bucket-s3-terraform-18042024"
    key            = "${path_relative_to_include()}/terragrunt/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "dynamodb-table-terraform-18042024"
    profile        = "segoja7-2"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  provider "aws" {
      region = "us-east-1"
      profile = "segoja7-2"
  }
  EOF
}

generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
    terraform {
      required_providers {
        cloudinit = {
          source = "hashicorp/cloudinit"
          version = "2.3.3"
        }
        local = {
          source = "hashicorp/local"
          version = "2.4.1"
        }
      }
    }
  EOF
}
