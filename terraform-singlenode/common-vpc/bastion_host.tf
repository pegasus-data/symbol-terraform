module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = ">= 2.0"

  name = "proofsys-symbol-bastion"

  ami           = var.ami_id
  instance_type = var.bastion_instance_type
  key_name      = var.key_name

  associate_public_ip_address = true

  vpc_security_group_ids = [module.sg.this_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 8
    },
  ]

  tags = {
    Terraform = true
  }
}
