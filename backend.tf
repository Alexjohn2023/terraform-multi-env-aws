terraform {
  cloud {
    organization = "alexcrh"

    workspaces {
      name = "terraform-provider-aws"
    }
  }
}
