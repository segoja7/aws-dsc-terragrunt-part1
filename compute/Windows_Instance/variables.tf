variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}