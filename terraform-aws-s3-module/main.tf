resource "aws_s3_bucket" "s3-state-store" {
  acl    = "private"
  bucket = var.s3_bucket_name
  region = var.region

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = module.tags.tags
}

resource "aws_s3_bucket_public_access_block" "s3-access-block" {
  bucket = aws_s3_bucket.s3-state-store.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
}