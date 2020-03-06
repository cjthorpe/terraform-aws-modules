# terraform-aws-route53-module
------------- 
 
Terraform module to create Route53 zones and records in AWS.
 
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
module “route53” { 
  hz_name         = var.hz_name 
  record_name     = var.record_name
  source          = “git::ssh://git-codecommit.eu-west-2.amazonaws.com/v1/repos/terraform-aws-modules//terraform-aws-route53-module" 
} 
``` 

Or for GitHub:

```
module "route53" {
  source          = “git@github.com:cjthorpe/terraform-aws-modules//terraform-aws-route53-module" 
}
```
 
The above variable definitions would assume the following form: 
``` 
variable "hz_name" { 
  default = "my.domain.uk"
  type    = string
} 
 
variable "record_name" { 
  default = "my.domain.uk"
  type    = string
} 
``` 
 
------------- 
## Inputs 
 
| Name | Description | Type | Default | Required | 
|------|-------------|:----:|:-----:|:-----:| 
| hz_name | The name of the hosted zone to create in Route53. | string | `-` | Yes | 
| record_name | The name of the record to create in Route53. | string | `-` | Yes |  
 
------------- 
## References 
 
This module also references [terraform-aws-tags-module](https://github.com/cjthorpe/terraform-aws-modules/tree/master/terraform-aws-tags-module).
