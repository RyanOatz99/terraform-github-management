# vim: set ft=terraform :

terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

provider "github" {
  owner = "my_github_account" # or use `export GITHUB_OWNER="my_github_account"`
  token = "my_github_token"   # or use `export GITHUB_TOKEN="my_github_token"`
}

module "github-personal" {
  source = "../.."

  github_repositories = {
    "my-repo" = { # repository name
      description            = "My GitHub repository"
      homepage_url           = "https://my-repo.tld"
      visibility             = "public"
      has_issues             = true
      has_projects           = false
      has_wiki               = false
      is_template            = false
      allow_merge_commit     = true
      allow_squash_merge     = true
      allow_rebase_merge     = true
      delete_branch_on_merge = false
      auto_init              = false
      gitignore_template     = null
      license_template       = null
      archived               = false
      archive_on_destroy     = false
      vulnerability_alerts   = true
      topics = [
        "github",
        "terraform",
      ]
      #pages = {
      #  "gh-pages" = {
      #    path  = "/"
      #    cname = null
      #  }
      #}
      pages = {} # disable/skip
      #template = {
      #  "my-github-template" = {
      #    owner = "my-github-organization"
      #  }
      #}
      template = {} # disable/skip
    },

    # more...
  }
}
