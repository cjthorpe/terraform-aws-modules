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

variable "hz_name" {
  description = "The name of the hosted zone."
  type        = string
}

variable "record_name" {
  description = "The name of the record."
  type        = string
}

variable "project_service" {
  default     = "Route53"
  description = "The name of the service. Used for resource tagging."
  type        = string
}

variable "ttl" {
  default     = "30"
  description = "The TTL of the record."
  type        = number
}

variable "type" {
  default     = "NS"
  description = "The record type."
  type        = string
}
