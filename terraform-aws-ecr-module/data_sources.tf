// Get the IAM role to be granted access.

data "aws_iam_role" "servicerole" {
  name = var.iam_role
}

// Get the ID of the VPC to use via the name tag.

data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name_tag != "" ? var.vpc_name_tag : var.default_vpc
  }
}
