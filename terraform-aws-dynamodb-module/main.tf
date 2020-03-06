# Create a DynamoDB table to allow for locking of Terraform state files.
# 
resource "aws_dynamodb_table" "dynamodb-state-lock" {
  hash_key       = var.hash_key
  name           = var.service_state_lock_table
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  attribute {
    name = var.hash_key
    type = "S"
  }

  tags = module.tags.tags
}
