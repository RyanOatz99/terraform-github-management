# vim: set ft=terraform :

terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

provider "github" {
  owner = "my-github-account" # or use `export GITHUB_OWNER="my-github-account"`
  token = "my-github-token"   # or use `export GITHUB_TOKEN="my-github-token"`
}

module "github-personal" {
  source = "../.."

  github_repositories = {
    # my-repo
    "my-repo" = {
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
      pages = [] # to disable/skip
      #template = [{
      #  owner      = "my-github-account"
      #  repository = "my-github-template"
      #}]
      template = [] # to disable/skip
    },

    # more...
  }
}
