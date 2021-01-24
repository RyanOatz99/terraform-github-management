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
      allow_merge_commit     = null
      allow_squash_merge     = null
      allow_rebase_merge     = null
      delete_branch_on_merge = null
      auto_init              = false
      gitignore_template     = null
      license_template       = null
      archived               = false
      archive_on_destroy     = false
      topics = [
        "github",
        "terraform",
      ]
      vulnerability_alerts = true
      #pages = [{
      #  branch = "gh-pages"
      #  path   = "/"
      #  cname  = null
      #}]
      pages = [] # disable/skip
      #template = [{
      #  owner      = "my-github-account"
      #  repository = "my-github-template"
      #}]
      template = [] # disable/skip
    },

    # more...
  }
}
