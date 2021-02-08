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

  memberships = {
    "my_github_member" = "member" # "username" = "role"
    "my_github_admin"  = "admin"
    # ...
  }

  team_roots = {
    "admin" = { # team name
      description = "Organization Admin"
      privacy     = "secret"
      maintainer  = false # creator is maintainer
    },

    "developer" = {
      description = "Organization Developer"
      privacy     = "closed"
      maintainer  = false
    },

    # ...
  }

  team_childs = {
    "terraform" = {
      description = "Terraformer"
      parent_team = "developer"
      maintainer  = false
    },
  }

  team_memberships = {
    "developer/my_github_member" = "member" # using "team/username" = "role"
    "admin/my_github_admin"      = "maintainer"
    # ...
  }

  repositories = {
    "my-org-repo" = { # repository name
      description            = "My GitHub Origanization repository"
      homepage_url           = "https://my-org-repo.tld"
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
        "organization",
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

    # ...
  }

  team_repositories = {
    "admin/my-org-repo" = "maintain" # "team/repository" = "permission"
    # ...
  }
}
