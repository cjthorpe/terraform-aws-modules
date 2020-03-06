variable "AZ" {   
  default     = "Regional"   
  description = "The availability zone in use. Use Regional or Global if AZ is not appropriate. Used for resource tagging."   
  type        = string   
}   
  
variable "environment" {   
  default     = "Production"   
  description = "The environment within which the infrastructure will be created. Used for resource tagging."   
  type        = string   
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key."
  type        = string
}

variable "project_service" { 
  default     = "DynamoDB" 
  description = "The name of the service. Used for resource tagging." 
  type        = string 
}

variable "read_capacity" {
  default     = 40
  description = "The number of read units for this table."
  type        = number
}

variable "service_state_lock_table" {
  description = "Name of the DynamoDB table."
  type        = string
}

variable "write_capacity" {
  default     = 40
  description = "The number of write units for this table."
  type        = number
}
