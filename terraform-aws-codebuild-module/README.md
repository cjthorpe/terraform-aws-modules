
# terraform-aws-codebuild-module

Terraform module to create one or more CodeBuild projects in AWS.

Requires Terraform v0.12 and utilises HCL2 syntax.

## SSH

Rather than expose SSH keys within code make use of ssh-agent to securely store the key for use with Terraform.

Follow the instructions [here](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-ssh-unixes.html) and carry out the instructions listed under _Step 3: Configure Credentials on Linux, macOs, or Unix_. Then add the new identity to ssh-agent as follows:

```
$ eval $(ssh-agent -s) ssh-add codecommit_rsa
```

## Usage

```
module "codebuild" { 
  description  = var.description
  project_defs = var.project_defs 
  source       = "git::ssh://git-codecommit.eu-west-2.amazonaws.com/v1/repos/terraform-aws-modules//terraform-aws-codebuild-module"
}
```

Or for GitHub:
```
module "codebuild" {
  source       = "git@github.com:cjthorpe/terraform-aws-modules//terraform-aws-codebuild-module"
}
```

The above variable definitions would assume the following form:
```
variables "description" {
  default     = "A build project for a pre-baked Docker image with build tools required for AWS VPCs with no Internet ingress/egress. Managed by Terraform."
  description = "A short description of the project."
  type        = string
}

variable "project_defs" {
  default = {
    "deployment-image-build" = "codebuild-images"
    "nginx-image-build" = "nginx-image"
  type    = map
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| description | A short description of the build project to be provisioned. | string | - | Yes |
| project_defs | A map of CodeBuild project names and CodeCommit repo locations in AWS. | map | - | Yes |

## References

This module also references [terraform-aws-tags-module](https://github.com/cjthorpe/terraform-aws-modules/tree/master/terraform-aws-tags-module).

