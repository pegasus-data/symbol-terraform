module "sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> v3.0"

  name            = "proofsys-symbol-bastion"
  description     = "Security Group for the Bastion Host"
  use_name_prefix = false

  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]

  egress_rules = [
    "http-80-tcp",
    "https-443-tcp",
    "ssh-tcp"
  ]

  tags = {
    Terraform = true
  }
}
