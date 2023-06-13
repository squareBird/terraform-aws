resource "aws_instance" "ec2" {
  count         = var.instance_count
  ami           = "ami-12345678"
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
}