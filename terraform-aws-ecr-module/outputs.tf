output "registries_id" {
  description = "The registry ID where the repository was created."
  value = {
    for item in aws_ecr_repository.ecr :
    item.name => item.registry_id
  }
}

output "registries_url" {
  description = "The URL of each repository."
  value = {
    for item in aws_ecr_repository.ecr :
    item.name => item.repository_url
  }
}

output "registries_arn" {
  description = "The ARN of each repository."
  value = {
    for item in aws_ecr_repository.ecr :
    item.name => item.arn
  }
}

output "registries_name" {
  description = "The name of each repository."
  value = {
    for item in aws_ecr_repository.ecr :
    item.name => item.name
  }
}
