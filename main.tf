terraform {
  required_version = ">= 0.12"
}

#provider "http" {} 

provider "aws" {
   # shared_credentials_file = "$HOME/.aws/credentials"
  #  profile = "default"
    region = "us-west-2"
}
terraform {
  backend "s3"{
  bucket = "terraform-bucket-123"
  region = "us-west-2" 
    key="terraform.tfstate"
  }
}


######## availability zones list

data "aws_availability_zones" "available" {}

#### VPC Module ####

module "aws-vpc" {
    source = "./modules/vpc"
    cidr_block = "172.16.0.0/16"
    vpc_name = "VPC-Test"
    eks_name = "eks-cluster-demo" ##Same name as eks_cluster for vpc and subnet tags
}

#### EKS Module ####

module "aws-eks" {
    source = "./modules/eks"
    cluster_name = "eks-cluster-demo"
    cluster_version = "1.20"
    eks_vpc_id = module.aws-vpc.vpc_id
    eks_subnets = module.aws-vpc.dev_public_subnets
    instance_types = ["t3.medium"]
    capacity_type = "ON_DEMAND"
    ec2_ssh_key = "infra-test"
} 


#### s3 Module ####
 module s3 {
  source = "./modules/s3"
  
 }

#### ec2 module ####

  module ec2 {
    source = "./modules/ec2"
    #vpc_security_group_ids = [module.vpc.default_security_group_id]
    #subnet_id = module.vpc.aws_subnet.dev-public-subnet[0].id
  }
