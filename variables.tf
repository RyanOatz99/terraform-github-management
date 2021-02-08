# vim: set ft=terraform :

# github_user_ssh_key
variable "github_user_ssh_keys" {
  description = "Add/remove SSH keys from your user account."
  type = map(object({
    # key = title
    key = string
  }))
  default = {} # empty/skip
}

# github_user_gpg_key
variable "github_user_gpg_keys" {
  description = "Add/remove GPG keys from your user account."
  type = map(object({
    # key = title/name
    armored_public_key = string
  }))
  default = {} # empty/skip
}

# github_membership
variable "github_memberships" {
  description = "Add/remove users from your organization."
  type        = map(string) # "username" = "role"
  default     = {}
}

# github_team
variable "github_team_roots" {
  description = "Add/remove teams from your organization."
  type = map(object({
    # key = name
    description = string
    privacy     = string
    maintainer  = bool
  }))
  default = {} # empty/skip
}

variable "github_team_childs" {
  description = "Add/remove teams with parent from your organization."
  type = map(object({
    # key = name
    description = string
    #privacy     = string # always closed
    parent_team = string
    maintainer  = bool
  }))
  default = {} # empty/skip
}

# github_team_membership
variable "github_team_members" {
  description = "Add/remove users from teams in your organization."
  type        = map(string) # "team/username" = "role"
  default     = {}          # empty/skip
}

# github_repository
variable "github_repositories" {
  description = "Create and manage repositories within your GitHub organization or personal account."
  type = map(object({
    # key = name
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
    vulnerability_alerts   = bool
    topics                 = list(string)

    pages = map(object({
      # key = branch
      path  = string
      cname = string
    }))

    template = map(object({
      # key = repository
      owner = string
    }))
  }))
}

# github_team_repository
variable "github_team_repositories" {
  description = "Manages relationships between teams and repositories in your GitHub organization."
  type = map(object({
    # key = repository
    team_name  = string
    permission = string
  }))
  default = {} # empty/skip
}
