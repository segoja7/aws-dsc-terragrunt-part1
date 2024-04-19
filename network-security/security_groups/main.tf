module "security_group_bastion" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "windows security group"
  description = "windows security group"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      description = "rdp ports"
      cidr_blocks = "172.16.0.0/16"
    },
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      description = "rdp ports"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 5986
      to_port     = 5986
      protocol    = "tcp"
      description = "winrm"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "http"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_with_cidr_blocks = [
    {
      description = "Allowing outbound traffic"
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
      from_port   = 0
    },
  ]
}