// Get the IAM role to be granted access. 
 
data "aws_iam_role" "servicerole" { 
  name = var.iam_role 
}

