resource "aws_ecr_lifecycle_policy" "ecr" {
  for_each   = local.repositories
  repository = each.key

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Remove untagged images.",
      "selection": {
        "tagStatus": "untagged",
        "countType": "imageCountMoreThan",
        "countNumber": 1
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 2,
      "description": "Rotate images when a total of ${var.maximum_image_count} images are stored.",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": ${var.maximum_image_count}
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "ecr_access" {
  statement {
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:PutImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:BatchGetImage",
    ]
    effect = "Allow"

    principals {
      identifiers = [data.aws_iam_role.servicerole.arn]
      type        = "AWS"
    }
    sid = "ECRAccess"
  }
}

resource "aws_ecr_repository_policy" "ecr_policy" {
  policy     = data.aws_iam_policy_document.ecr_access.json
  for_each   = local.repositories
  repository = each.key
}
