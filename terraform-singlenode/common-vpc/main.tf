#-------------------------------     
# AWS Provider
#-------------------------------
provider "aws" {
  region  = "us-east-2"
  
}

#-------------------------------
# S3 Remote State
# Ref: https://carlocayos.dev/2020/07/terraforming-an-aws-vpc-part-2/#terraform-workspace
#-------------------------------
terraform {
  backend "s3" {
    bucket         = "statebucket-symbol"
    key            = "symbol-vpc.tfstate"
    region         = "us-east-2"
    dynamodb_table = "symbol-tf-lock"
  }
}