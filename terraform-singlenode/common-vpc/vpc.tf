module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = ">= 2.0"

  name = "symbol-signlenode-vpc"
  cidr = var.vpc_cidr

  azs              = var.vpc_region_az
  public_subnets   = var.public_subnet_cidr
  private_subnets  = var.private_subnet_cidr

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway

  map_public_ip_on_launch = false

  // applies to all provisioned resources
  tags = {
    Project     = var.tag_project_name
  }
}