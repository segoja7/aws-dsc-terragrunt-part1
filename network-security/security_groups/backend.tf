# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = "bucket-s3-terraform-18042024"
    dynamodb_table = "dynamodb-table-terraform-18042024"
    encrypt        = true
    key            = "network-security/security_groups/terragrunt/terraform.tfstate"
    profile        = "segoja7-2"
    region         = "us-east-1"
  }
}