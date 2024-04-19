module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  name    = "windows-server"

  ami                         = "ami-00d990e7e5ece7974" #Microsoft Windows Server 2022 Base
  instance_type               = "t3.medium"
  subnet_id                   = element(var.public_subnet_ids, 0)
  key_name                    = "clustersql2"
  monitoring                  = true
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true


  create_iam_instance_profile = true
  iam_role_description        = "IAM role for EC2 instance"
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    AmazonS3FullAccess           = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  }

  user_data                   = file("${path.module}/userdata/bastion_user_data.ps1")
  user_data_replace_on_change = true

  tags = local.tags

}

