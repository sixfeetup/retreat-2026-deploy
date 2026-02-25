terraform {
  required_version = ">= 1.4"
  backend "s3" {
    region         = "us-east-1"
    bucket         = "retreat-2026-deploy-terraform-state"
    key            = "retreat_2026_deploy.prod.json"
    encrypt        = true
    dynamodb_table = "retreat-2026-deploy-terraform-state"
  }
}
