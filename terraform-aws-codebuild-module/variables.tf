variable "AZ" { 
  default     = "Regional" 
  description = "The availability zone in use. Use Regional or Global if AZ is not appropriate. Used for resource tagging." 
  type        = string 
} 

variable "description" {
  description = "A short description of the project."
  type        = string
}

variable "environment" { 
  default     = "Production" 
  description = "The environment within which the infrastructure will be created. Used for resource tagging." 
  type        = string 
}

variable "iam_role" { 
  default     = "" 
  description = "The AWS IAM role to be granted permission to access CodeCommit."
}

variable "project_defs" {
  description = "Map of project names and repo locations."
  type        = map
}

variable "project_service" { 
  default     = "CodeBuild" 
  description = "The name of the service. Used for resource tagging." 
  type        = string 
}

