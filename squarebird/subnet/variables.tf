variable "vpc_id" {
  description = "Target VPC ID"
  type        = string
}

variable "subnet_cidrs" {
  description = "List of subnet CIDR blocks"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of Availability Zones"
  type = list(string)
}

variable "subnet_name" {
  description = "Name of subnet"
  type = string
}