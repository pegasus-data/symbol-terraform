aws_region = "us-east-2"

vpc_cidr = "10.36.0.0/16"

vpc_region_az = ["us-east-2a", "us-east-2b", "us-east-2c"]

public_subnet_cidr = ["10.36.101.0/24", "10.36.102.0/24", "10.36.103.0/24"]

private_subnet_cidr = ["10.36.1.0/24"]

enable_dns_hostnames = true

enable_dns_support = true

enable_nat_gateway = false

single_nat_gateway = false

tag_project_name = "proofsys-symbol-tag"

bastion_instance_type = "t3a.nano"

symbol_instance_type = "t3.small"

key_name = "template-ssh-key-1"

# ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20210430 in us-east-2 ##
ami_id = "ami-00399ec92321828f5"

############# storage spec ###
symbol_ebs_size = 10
symbol_ebs_type = "gp2"


############
api_additional_sg_ids = []