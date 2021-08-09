output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "public_subnets_cidr_blocks" {
  value = module.vpc.public_subnets_cidr_blocks
}

output "private_subnets_cidr_blocks" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "bastion_public_ip" {
  value = module.bastion.public_ip
}

output "symbol_private_ip" {
  value = module.ec2_symbol.private_ip
}

output "symbol_public_ip" {
  value = module.ec2_symbol.public_ip
}
