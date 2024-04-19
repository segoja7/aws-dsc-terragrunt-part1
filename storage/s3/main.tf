module "s3-bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "4.1.2"
  bucket        = "s3-script-dsc-${random_string.script_suffix.result}"
  force_destroy = true

}

module "s3-bucket_object" {
  source      = "terraform-aws-modules/s3-bucket/aws//modules/object"
  version     = "4.1.2"
  bucket      = module.s3-bucket.s3_bucket_id
  key         = "dsc.ps1"
  file_source = "../../scripts/dsc.ps1"

}

resource "random_string" "script_suffix" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}