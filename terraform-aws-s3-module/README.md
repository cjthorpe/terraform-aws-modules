# terraform-aws-s3-module
-------------   
   
Terraform module to create one or more S3 buckets in AWS.  
   
Requires Terraform v0.12 and utilises HCL2 syntax.   
   
-------------   
## SSH   
   
Rather than expose SSH keys within code make use of ssh-agent to securely store the key for use with Terraform.   
   
Follow the instructions [here](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-ssh-unixes.html) and carry out the instructions listed under _Step 3: Configure Credentials on Linux, macOs, or Unix_. Then add the new identity to ssh-agent as follows:   
   
```   
$ eval $(ssh-agent -s) ssh-add codecommit_rsa   
```   

-------------   
## Usage   
   
```   
module "s3" {
  region         = var.region
  s3_bucket_name = var.s3_bucket_name
  source         = "git::ssh://git-codecommit.eu-west-2.amazonaws.com/v1/repos/terraform-aws-modules//terraform-aws-s3-module"
}
```

Or for GitHub:

```
module "s3" {
  source         = "git@github.com:cjthorpe/terraform-aws-modules//terraform-aws-s3-module"
}
```
   
The above variable definitions would assume the following form:   
``` 
variable "region" {
  default     = var.region
  description = "The region in which the S3 bucket will reside."
  type        = string
}
variable "s3_bucket_name" { 
  default     = "terraform-bucket-name"
  description = "The S3 bucket name."
  type        = string 
}
```   

-------------   
## Inputs

| Name | Description | Type | Default | Required |   
|------|-------------|:----:|:-----:|:-----:|
| region | The region in which the S3 bucket will reside. | string | '-' | Yes |
| s3_bucket_name | S3 bucket name that will store the state for this infrastructure. | string | `-` | Yes |   
   
-------------   
## References   
   
This module also references [terraform-aws-tags-module](https://github.com/cjthorpe/terraform-aws-modules/tree/master/terraform-aws-tags-module).
