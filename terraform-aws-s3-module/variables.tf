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

variable "project_service" {  
  default     = "S3"  
  description = "The name of the service. Used for resource tagging."  
  type        = string  
} 

variable "region" {
  description = "The region in which the S3 bucket will reside."
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name that will store the state for the infrastructure."
  type        = string
}
