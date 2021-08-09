
# symbol-terraform

This repo offers a terraform-driven solution to standup your singlenode symbol private network.

Scripts found here automates the provisioning of an AWS VPC (with needed public and private subnets), a bastion node to protect unauthorized logins and the actual Symbol SOLO-node up to this point:
https://github.com/symbol/symbol-bootstrap#usage





## PreWork
---
To be able to run your terraform scripts smoothly, you need to provision your own TF state environment, with templates found in folder:
```bash
$ ls -la ./terraform-singlenode/state
```

In essence, you need to spinup three things:
- your own S3 bucket 
- your own DynamoDB table to manage your TF state
- define your own SSH keypair in the AWS EC2 Dashboard



## Define your ENV VARs
---
The terraform scripts used here will depend on your custom definitions in VAR file:
```bash
$ cat terraform-singlenode/common-vpc/environment/dev-us-east-2/vpc.tfvars 
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

# SSH key needs to be present in your AWS EC2 management dashboard 
key_name = "template-ssh-key-1"

# ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20210430 in us-east-2 ##
ami_id = "ami-00399ec92321828f5"

############# storage spec ###
symbol_ebs_size = 10
symbol_ebs_type = "gp2"


############

```



^ I have set/defined the vpc regions and corresponding subnets for your convenience.  These values are good to go but please feel free to customize as per your needs. 





## Actual provisioning using Terraform
---

To standup your AWS resources in the root folder, run terraform against the variable file.  No workspace needed.
```bash
$ cd terraform-singlenode/common-vpc/
$ terraform apply -var-file=environment/dev-us-east-2/vpc.tfvars 
```
After provisioning, terraform will output some data about your new resources.

---
Test your SSH connection by logging into the bastion public IP.  Get the IP from the output:
```bash
bastion_public_ip = [
  "X.X.X.X",
]
```


From the bastion, ssh into the Symbol node by using the PRIVATE IP found in output:
```bash
symbol_private_ip = [
  "X.X.X.X",
]
```

---
---



# Running Symbol commands inside the node:


Feel free to run the necessary Symbol commands found in this reference:
https://docs.symbolplatform.com/guides/network/creating-a-private-test-net.html#instantiate-the-network


You can also use this SOLO-node to setup your own private Symbol network using the command presets:
https://github.com/symbol/symbol-bootstrap#out-of-the-box-presets



---
