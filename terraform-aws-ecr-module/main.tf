locals {
  repositories = { for repo in var.repository_name : repo => repo }
}

resource "aws_ecr_repository" "ecr" {
  for_each             = local.repositories
  name                 = each.key
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = var.scan_images_on_push
  }

  tags = merge(
    map(
        "TYPE", var.type
    ),
    module.tags.tags
  )
}

