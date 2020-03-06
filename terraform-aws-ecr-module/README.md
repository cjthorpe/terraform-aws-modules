# terraform-aws-ecr-module
-------------

Terraform module to create one or more Elastic Container Registries in AWS.

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
module “ecr” {
  repository_name = var.repository_name
  source          = “git::ssh://git-codecommit.eu-west-2.amazonaws.com/v1/repos/terraform-aws-modules//terraform-aws-ecr-module"
  vpc_name_tag    = var.vpc_name_tag
}
```

Or for GitHub:

```
module "ecr" {
  source          = “git@github.com:cjthorpe/terraform-aws-modules//terraform-aws-ecr-module"
}
```
  

The above variable definitions would assume the following form:
```
variable "repository_name" {
  type    = list(string)
  default = ["prometheus", "thanos"]
}

variable "vpc_name_tag" {
  default = "MY-VPC-PROD-UK"
}
```

-------------
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| repository_name | One or more names of elastic container repositories to be created in AWS. | list(string) | `-` | Yes |
| vpc_name_tag | The name tag of the Prod VPC within which we wish to pull images to. | String | `-` | Yes | 

-------------
## References

This module also references [terraform-aws-tags-module](https://github.com/cjthorpe/terraform-aws-modules/tree/master/terraform-aws-tags-module).

