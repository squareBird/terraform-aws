variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "vpc_name" {
  type = string
}

#
#variable "subnet_cidrs" {
#  description = "List of subnet CIDR blocks"
#  type        = list(string)
#}
#
#variable "instance_count" {
#  description = "Number of EC2 instances"
#  type        = number
#}
#
#variable "instance_type" {
#  description = "Type of EC2 instance"
#  type        = string
#}

# Terraform Cloud와 연동을위해 변수 정의
variable "aws_access_key_id" {
  description = "AWS Access Key Id"
  type = string
}

variable "aws_secret_access_key" {
  description = "AWS Access Key Id"
  type = string
}