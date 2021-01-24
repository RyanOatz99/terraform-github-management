# vim: set ft=terraform :

terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

provider "github" {
  organization = "my_github_organization" # or use `export GITHUB_ORGANIZATION="my_github_organization"`
  token        = "my_github_token"        # or use `export GITHUB_TOKEN="my_github_token"`
}

module "github-organization" {
  source = "../.."

  github_memberships = {
    "my_github_member" = { # account name
      role = "member"
    },

    "my_github_admin" = {
      role = "admin"
    },

    # ...
  }

  github_teams = {
    "admin" = { # team name
      description = "Organization Admin"
      privacy     = "secret"
    },

    "developer" = {
      description = "Organization Developer"
      privacy     = "closed"
    },

    # ...
  }

  github_team_members = {
    "developer-my_github_member" = { # using <team_name>-<member_name>
      role = "member"
    },

    "admin-my_github_admin" = {
      role = "maintainer"
    },

    # ...
  }

  github_repositories = {
    "my-org-repo" = { # repository name
      description            = "My GitHub Origanization repository"
      homepage_url           = "https://my-org-repo.tld"
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
        "organization",
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
      #  owner      = "my-github-organization"
      #  repository = "my-github-template"
      #}]
      template = [] # disable/skip
    },

    # ...
  }

  github_team_repositories = {
    "my-org-repo" = { # repository name
      team_name  = "admin"
      permission = "maintain"
    },

    # ...
  }
}
