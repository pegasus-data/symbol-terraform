#-------------------------------     
# AWS Provider
#-------------------------------
provider "aws" {
  region  = "us-east-2"
  
}

#-------------------------------
# S3 Remote State
#-------------------------------
terraform {
  backend "s3" {
    bucket         = "statebucket-digitalocean"
    key            = "trivut-1-common.tfstate"
    region         = "us-east-2"
    
  }
}