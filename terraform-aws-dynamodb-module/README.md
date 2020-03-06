# terraform-aws-dynamodb-module
-------------  
  
Terraform module to create a DynamoDB table in AWS.
  
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
module "dynamodb" {  
  hash_key                 = var.hash_key
  service_state_lock_table = var.service_state_lock_table
  source                   = "git::ssh://git-codecommit.eu-west-2.amazonaws.com/v1/repos/terraform-aws-modules//terraform-aws-dynamodb-module"
}
```

Or for GitHub:

```
module "dynamodb" {
  source                   = "git@github.com:cjthorpe/terraform-aws-modules//terraform-aws-dynamodb-module"
}
```
  
  
The above variable definitions would assume the following form:  
```
variable "hash_key" {
  default = ""
  type    = string
}

variable "service_state_lock_table" {  
  default = "terraform-module-state-lock" 
  type    = string 
}  

```
  
-------------  
## Inputs  
  
| Name | Description | Type | Default | Required |  
|------|-------------|:----:|:-----:|:-----:|  
| hash_key | The attribute to use as the hash (partition) key. | string | - | Yes |
| service_state_lock_table | The name of the table, this needs to be unique within a region. | string | `-` | Yes |  
  
-------------  
## References  
  
This module also references [terraform-aws-tags-module](https://github.com/cjthorpe/terraform-aws-modules/tree/master/terraform-aws-tags-module).
