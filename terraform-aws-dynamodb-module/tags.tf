module "tags" {   
  AZ              = var.AZ   
  environment     = var.environment   
  project_service = var.project_service   
  source          = "git@github.com:cjthorpe/terraform-aws-modules//terraform-aws-tags-module"
}
