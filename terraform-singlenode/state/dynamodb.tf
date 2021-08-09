resource "aws_dynamodb_table" "tf-lock" {
  name           = "symbol-tf-lock"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}