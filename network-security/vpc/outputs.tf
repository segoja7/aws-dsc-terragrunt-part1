output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.private_subnets
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "availability_zones" {
  value = module.vpc.azs
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

#output "subnets_names" {
#  value = module.vpc.sub
#}