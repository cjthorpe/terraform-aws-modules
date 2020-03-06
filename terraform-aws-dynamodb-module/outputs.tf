output "dynamo_db_table" {
  value = "${aws_dynamodb_table.dynamodb-state-lock.id}"
}
