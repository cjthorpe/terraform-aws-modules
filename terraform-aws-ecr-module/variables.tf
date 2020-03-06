variable "AZ" {
  default     = "Regional"
  description = "The availability zone in use. Use Regional or Global if AZ is not appropriate."
  type        = string
}

variable "default_vpc" {
  default     = "MY-VPC-PROD-UK"
  description = "Default VPC within Prod to use if no VPC parameter is passed to this module."
}

variable "environment" {
  default     = "Production"
  description = "The environment within which the infrastructure will be created. Used for tagging."
  type        = string
}

variable "iam_role" {
  default     = "my-codebuild-service-role"
  description = "The AWS IAM role to be granted permission to access the ECR."
}

variable "maximum_image_count" {
  default     = 50
  description = "When this number of images are stored in the repository, rotate the images."
}

variable "project_service" {
  default     = "AWS ECR"
  description = "The name of the service."
  type        = string
}

variable "repository_name" {
  default     = []
  description = "One or more names of elastic container repositories to be created in AWS."
  type        = list(string)
}

variable "region" {
  default     = "eu-west-2"
  description = "The AWS region to create the ECR within."
}

variable "scan_images_on_push" {
  default     = true
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
}

variable "type" {
  default     = "Repository"
  description = "A custom tag which denotes the service type."
  type        = string
}

variable "vpc_name_tag" {
  default     = ""
  description = "The name tag of the Prod VPC within which we wish to pull images to. Allows us to pull images without traversing through the public internet."
}
