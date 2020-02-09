# terraform-aws-tags-module

Terraform module to define mandatory tags for AWS infrastructure and resources.

Requires Terraform v0.12 and utilises HCL2 syntax.

## SSH

Rather than expose SSH keys within code make use of ssh-agent to securely store the key for use with Terraform.

Follow the instructions [here](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-ssh-unixes.html) and carry out the instructions listed under _Step 3: Configure Credentials on Linux, macOs, or Unix_. Then add the new identity to ssh-agent as follows:

```
$ eval $(ssh-agent -s) ssh-add codecommit_rsa
```

## Usage

```
module "tags" {
  AZ              = var.az
  environment     = var.environment
  project_service = var.project_service
  source          = "git::ssh://git-codecommit.eu-west-2.amazonaws.com/v1/repos/terraform-aws-modules//terraform-aws-tags-module"
}
```

Or for GitHub:
```
module "tags" {
  source          = "git@github.com:cjthorpe/terraform-aws-modules//terraform-aws-tags-module"
}
```

The above variable definitions would assume the following form:
```
variable "AZ" {  description = "The availability zone in use. Use Regional or Global if AZ is not appropriate."
  type        = string
}

variable "environment" {
  default     = "Production"  description = "The environment within which the infrastructure will be created. Used for tagging."
  type        = string
}

variable "project_service" {
  default     = "AWS ECR"
  description = "The name of the service."
  type        = string
}
```
To call the tags modules within your code, either call directly to apply only the mandatory tags:
```
tags = module.tags.tags
```

Or include some custom tags as well:
```
tags = merge( 
         map( 
          "TYPE", var.type 
         ), 
         module.tags.tags 
       ) 
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| AZ | The availability zone in use. Use Regional or Global if AZ is not appropriate. | string | - | Yes |
| environment | The environment within which the infrastructure will be created. | string | - | Yes |
| project_service | The name of the service. | string | - | Yes |
