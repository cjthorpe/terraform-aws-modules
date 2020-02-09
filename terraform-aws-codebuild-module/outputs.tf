output "project_name" {
  description = "The name(s) of the CodeBuild project(s)."
  value = {
    for item in aws_codebuild_project.basic :
    item.name => item.arn
  }
}

