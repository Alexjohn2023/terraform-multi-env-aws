terraform {
  backend "s3" {
    bucket       = "alex-terraform-state-2026"
    key          = "workspaces-demo/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}