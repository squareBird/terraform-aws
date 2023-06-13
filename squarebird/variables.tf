variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet_cidrs" {
  description = "List of subnet CIDR blocks"
  type        = list(string)
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}
