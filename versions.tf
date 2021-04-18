# vim: set ft=terraform :

terraform {
  required_version = "~>0.14"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.9.1"
    }
  }
}
