#---------------------
# AWS PROVIDER
#---------------------
variable "aws_region" {
  description = "AWS Set Region"
}

#---------------------
# General vars
#---------------------
variable "tag_project_name" {
  description = "Project Name"
}

#---------------------
# VPC, LoadBalancer, Autoscaling, etc.
#---------------------
variable "vpc_cidr" {
  description = "VPC CIDR Block"
}

variable "vpc_region_az" {
  type        = list(string)
  description = "VPC Region Availability Zone"
}

variable "public_subnet_cidr" {
  type        = list(string)
  description = "VPC List of CIDR Block for public subnets"
}

variable "private_subnet_cidr" {
  type        = list(string)
  description = "VPC List of CIDR Block for private subnets"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  default     = true
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = false
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}

variable "ami_id" {
  description = "ami ID of all ec2 involved"
}

variable "key_name" {
  description = "Name of EC2 Keypair"
  type        = string
}

variable "bastion_instance_type" {
  description = "Bastion Instance Type"
  type        = string
}

variable "symbol_instance_type" {
  description = "Symbol Node Instance Type"
  type        = string
}

variable "symbol_ebs_size" {
  type = number
}

variable "symbol_ebs_type" {
  type = string
}

variable "api_additional_sg_ids" {
  type = list(string)
}