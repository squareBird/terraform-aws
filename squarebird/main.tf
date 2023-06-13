terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.5.0"
    }
  }
}

provider "aws" {
  profile = "squarebird"
  region = "ap-northeast-2"
  # variables.tf에 정의
  # Terraform Cloud에서 변수로 정의해줄 수 있의
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

module "vpc" {
  source       = "./vpc"
  vpc_cidr     = "10.0.0.0/16"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "ec2" {
  source           = "./ec2"
  instance_count   = 2
  instance_type    = "t2.micro"
  subnet_id        = module.vpc.subnet_ids[0]
}

terraform {
  backend "s3" {
    bucket         = "squarebird-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-state-lock"
  }
}