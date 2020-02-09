resource "aws_codebuild_project" "basic" {
  for_each      = var.project_defs
  name          = each.key
  build_timeout = "5"
  description   = var.description
  service_role  = data.aws_iam_role.servicerole.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:3.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status      = "ENABLED"
    }

    s3_logs {
      status = "DISABLED"
    }
  }

  source {
    git_clone_depth = 1
    location        = each.value
    type            = "CODECOMMIT"
  }

  tags = module.tags.tags
}

