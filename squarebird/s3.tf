resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "squarebird-terraform-state-bucket"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
