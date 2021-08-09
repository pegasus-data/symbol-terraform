module "ec2_symbol" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = ">= 2.0"

  name           = "proofsys-symbol-singlenode"

  ami            = var.ami_id
  instance_type  = var.symbol_instance_type

  disable_api_termination     = false
  associate_public_ip_address = true
  key_name      = var.key_name
  
  user_data = <<-EOF
          #!/bin/bash
          
          logfile=/var/log/symbol_setup.log
          exec >> $logfile 2>&1

          sudo apt update -y
          sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
          sudo chmod +x /usr/local/bin/docker-compose
          sudo apt remove docker docker-engine docker.io containerd runc -y
          sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
          curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88
          sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
          sudo apt update -y
          sudo apt install net-tools -y
          sudo apt install docker-ce docker-ce-cli containerd.io -y
          sleep 1
          sudo apt install npm -y
          sudo npm install -g symbol-bootstrap
          sleep 1
          symbol-bootstrap start -p bootstrap -a full
          echo " ------- REACHED THE END OF SCRIPT ------ "
          EOF

  vpc_security_group_ids = concat([
    module.sg_symbol.this_security_group_id,
    module.target.this_security_group_id,
  ], var.api_additional_sg_ids)

  subnet_ids = module.vpc.public_subnets

  root_block_device = [
    {
      volume_type = var.symbol_ebs_type
      volume_size = var.symbol_ebs_size
    }
  ]

  tags = {
    Terraform = true
  }
}
