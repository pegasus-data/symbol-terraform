resource "aws_s3_bucket" "tf-state" {
  bucket = "statebucket-symbol"

  versioning = {
    enabled = false
  }
}