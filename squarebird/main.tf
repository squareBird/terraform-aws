terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.5.0"
    }
  }
}

provider "aws" {
  region     = "ap-northeast-2"
  # variables.tf에 정의
  # Terraform Cloud에서 변수로 정의해줄 수 있의
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

# main vpc
module "main_vpc" {
  source   = "./vpc"
  vpc_cidr = "192.168.0.0/16"
  vpc_name = "main_vpc"
}

# 아래처럼 module.vpc.vpc_id 형태로 하면 생성 후 output을 사용할 수 있음
module "public_subnet" {
  subnet_name        = "public_subnet"
  source             = "./subnet"
  vpc_id             = module.main_vpc.vpc_id
  subnet_cidrs       = ["192.168.1.0/24", "192.168.2.0/24"]
  availability_zones = ["ap-northeast-2a", "ap-northeast-2c"]
}

# 아래처럼 module.vpc.vpc_id 형태로 하면 생성 후 output을 사용할 수 있음
module "priavte_subnet" {
  subnet_name        = "priavte_subnet"
  source             = "./subnet"
  vpc_id             = module.main_vpc.vpc_id
  subnet_cidrs       = ["192.168.3.0/24", "192.168.4.0/24"]
  availability_zones = ["ap-northeast-2a", "ap-northeast-2c"]
}

module "jenkins" {
  source         = "./ec2"
  instance_count = 1
  instance_type  = "t2.micro"
  ami            = "ami-0462a914135d20297"
  subnet_id      = module.public_subnet.subnet_ids[0] // 향후 랜덤값 사용하도록 변경 예정
}