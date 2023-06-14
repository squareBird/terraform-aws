resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "squarebird-terraform-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
