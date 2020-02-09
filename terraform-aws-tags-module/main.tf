locals {
  mandatory_tags = map(
    "ACCESS", "Private",
    "AZ", var.AZ,
    "ENVIRONMENT", var.environment,
    "PROJECT-SERVICE", var.project_service,
    "SERVICE-TYPE", "Infrastructure",
    "TERRAFORM-MANAGED", "True"
  )
}

