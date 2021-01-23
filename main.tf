# vim: set ft=terraform :

# github_membership
# https://registry.terraform.io/providers/integrations/github/4.3.0/docs/resources/membership
resource "github_membership" "this" {
  for_each = var.github_memberships

  username = each.key
  role     = each.value.role
}

# github_team
# https://registry.terraform.io/providers/integrations/github/4.3.0/docs/resources/team
resource "github_team" "this" {
  for_each = var.github_teams

  name        = each.key
  description = each.value.description
  privacy     = each.value.privacy
}

# github_team_membership
# https://registry.terraform.io/providers/integrations/github/4.3.0/docs/resources/team_membership
resource "github_team_membership" "this" {
  for_each = var.github_team_members
  depends_on = [
    github_team.this
  ]

  team_id  = github_team.this[split("-", each.key)[0]].id
  username = split("-", each.key)[1]
  role     = each.value.role
}

# github_repository
# https://registry.terraform.io/providers/integrations/github/4.3.0/docs/resources/repository
resource "github_repository" "this" {
  for_each = var.github_repositories
  depends_on = [
    github_team.this
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
        branch = pages.value.branch
        path   = pages.value.path
      }
      cname = pages.value.cname
    }
  }

  dynamic "template" {
    for_each = each.value.template

    content {
      owner      = template.value.owner
      repository = template.value.repository
    }
  }
}

# github_team_repository
# https://registry.terraform.io/providers/integrations/github/4.3.0/docs/resources/team_repository
resource "github_team_repository" "this" {
  depends_on = [
    github_repository.this
  ]
  for_each = var.github_team_repositories

  team_id    = github_team.this[each.value.team_name].id
  repository = each.key
  permission = each.value.permission
}
