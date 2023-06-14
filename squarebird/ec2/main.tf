resource "aws_instance" "ec2" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id[count.index]
}