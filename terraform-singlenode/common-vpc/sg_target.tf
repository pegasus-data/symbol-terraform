module "target" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> v3.0"

  name            = "proofsys-symbol-target"
  description     = "Security Group for SSH Connections via Bastion Host"
  use_name_prefix = false

  vpc_id = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      rule                     = "ssh-tcp"
      source_security_group_id = module.sg.this_security_group_id
    }
  ]

  tags = {
    Terraform = true
  }
}
