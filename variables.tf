# vim: set ft=terraform :

# github_membership
variable "github_memberships" {
  description = "Add/remove users from your organization."
  type = map(object({
    role = string
  }))
  default = {}
}

# github_team
variable "github_teams" {
  description = "Add/remove teams from your organization."
  type = map(object({
    description = string
    privacy     = string
  }))
  default = {}
}

# github_team_membership
variable "github_team_members" {
  description = "Add/remove users from teams in your organization."
  type = map(object({
    role = string
  }))
  default = {}
}

# github_repository
variable "github_repositories" {
  description = "Create and manage repositories within your GitHub organization or personal account."
  type = map(object({
    description            = string
    homepage_url           = string
    visibility             = string
    has_issues             = bool
    has_projects           = bool
    has_wiki               = bool
    is_template            = bool
    allow_merge_commit     = bool
    allow_squash_merge     = bool
    allow_rebase_merge     = bool
    delete_branch_on_merge = bool
    auto_init              = bool
    gitignore_template     = string
    license_template       = string
    archived               = bool
    archive_on_destroy     = bool
    topics                 = list(string)
    vulnerability_alerts   = bool
    pages = list(object({
      branch = string
      path   = string
      cname  = string
    }))
    template = list(object({
      owner      = string
      repository = string
    }))
  }))
  default = {}
}

# github_team_repository
variable "github_team_repositories" {
  description = "Manages relationships between teams and repositories in your GitHub organization."
  type = map(object({
    team_name  = string
    permission = string
  }))
  default = {}
}
