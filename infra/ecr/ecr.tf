
data "aws_caller_identity" "current" {}

terraform {
  backend "s3" {
    dynamodb_table = "terraform-state-lock"
    bucket         = "966270299484-terraform-state"
    key            = "common/ecr-ui-app.tfstate"
    region         = "eu-west-1"
    profile        = "pollen-nonprod"
  }
}

module "ecr_repo" {
  source        = "git::git@github.com:SainsburysNDA/pollen-infra-common.git//terraform-alb-ecs/modules/ecr-repo"
  ecr_repo_name = var.ecr_repo_name
}


variable "ecr_repo_name" {}
