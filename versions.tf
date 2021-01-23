# vim: set ft=terraform :

terraform {
  required_providers {

    # integrations/github
    # https://registry.terraform.io/providers/integrations/github/4.3.0/docs
    github = {
      source  = "integrations/github"
      version = "=4.3.0"
    }
  }
}
