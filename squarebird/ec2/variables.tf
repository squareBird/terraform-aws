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

variable "ami" {
  description = "AMI"
  type = string
}
#
#variable "load_balancer_id" {
#  description = "Load Balancer ID"
#  type        = string
#}