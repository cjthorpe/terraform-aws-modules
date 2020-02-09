variable "AZ" {
  description = "The availability zone in use. Use Regional or Global if AZ is not appropriate."
  type = string
}

variable "environment" {
  description = "The environment within which the IaC will be provisioned."
  type = string
}

variable "project_service" {
  description = "The name of the service being created."
  type = string
}

