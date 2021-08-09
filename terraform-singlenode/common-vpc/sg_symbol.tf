module "sg_symbol" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> v3.0"

  name            = "proofsys-symbol-SG"
  description     = "Security Group for the Proofsys Symbol Chain Single Node"
  use_name_prefix = false

  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules = [
    "http-80-tcp",
    "https-443-tcp",
  ]

  ingress_with_cidr_blocks = [
    {
      from_port   = 7900
      to_port     = 7902
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Symbol Chain"
    },
    {
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Symbol Chain REST"
    }
  ]

  egress_rules = [
    "http-80-tcp",
    "https-443-tcp",
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 7900
      to_port     = 7902
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Symbol Chain"
    }
  ]

  tags = {
    Terraform = true
  }
}
