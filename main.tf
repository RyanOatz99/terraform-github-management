# vim: set ft=terraform :

# github_user_ssh_key
resource "github_user_ssh_key" "this" {
  for_each = var.user_ssh_keys

  title = each.key
  key   = each.value.key
}

# github_user_gpg_key
resource "github_user_gpg_key" "this" {
  for_each = var.user_gpg_keys

  # each.key is unused here
  armored_public_key = each.value.armored_public_key
}

# github_membership
resource "github_membership" "this" {
  for_each = var.memberships

  username = each.key
  role     = each.value
}

# github_team
resource "github_team" "root" {
  for_each = var.team_roots

  name                      = each.key
  description               = each.value.description
  privacy                   = each.value.privacy
  create_default_maintainer = each.value.maintainer
}

resource "github_team" "child" {
  for_each = var.team_childs

  name                      = each.key
  description               = each.value.description
  privacy                   = "closed" #each.value.privacy
  parent_team_id            = github_team.root[each.value.parent_team].id
  create_default_maintainer = each.value.maintainer
}

locals {
  teams = merge(github_team.root, github_team.child)
}

# github_team_membership
resource "github_team_membership" "this" {
  for_each = var.team_memberships
  depends_on = [
    github_team.root,
    github_team.child
  ]

  team_id  = local.teams[split("/", each.key)[0]].id
  username = split("/", each.key)[1]
  role     = each.value
}

# github_repository
resource "github_repository" "this" {
  for_each = var.repositories
  depends_on = [
    github_team.root,
    github_team.child
  ]

  name                   = each.key
  description            = each.value.description
  homepage_url           = each.value.homepage_url
  visibility             = each.value.visibility
  has_issues             = each.value.has_issues
  has_projects           = each.value.has_projects
  has_wiki               = each.value.has_wiki
  is_template            = each.value.is_template
  allow_merge_commit     = each.value.allow_merge_commit
  allow_squash_merge     = each.value.allow_squash_merge
  allow_rebase_merge     = each.value.allow_rebase_merge
  delete_branch_on_merge = each.value.delete_branch_on_merge
  auto_init              = each.value.auto_init
  gitignore_template     = each.value.gitignore_template
  license_template       = each.value.license_template
  archived               = each.value.archived
  archive_on_destroy     = each.value.archive_on_destroy
  topics                 = each.value.topics
  vulnerability_alerts   = each.value.vulnerability_alerts

  dynamic "pages" {
    for_each = each.value.pages

    content {
      source {
        branch = pages.key
        path   = pages.value.path
      }
      cname = pages.value.cname
    }
  }

  dynamic "template" {
    for_each = each.value.template

    content {
      repository = template.key
      owner      = template.value.owner
    }
  }
}

# github_team_repository
resource "github_team_repository" "this" {
  depends_on = [
    github_team.root,
    github_team.child,
    github_repository.this
  ]
  for_each = var.team_repositories

  repository = split("/", each.key)[1]
  team_id    = local.teams[split("/", each.key)[0]].id
  permission = each.value
}
