# vim: set ft=terraform :

# github_team
output "team_root_ids" {
  description = "The IDs of the created root teams."
  value       = { for team in github_team.root : team.name => team.id }
}

output "team_child_ids" {
  description = "The IDs of the created child teams."
  value       = { for team in github_team.child : team.name => team.id }
}

# github_repository
output "repo_git_clone_urls" {
  description = "URLs that can be provided to `git clone` to clone the repository anonymously via the git protocol."
  value       = { for repo in github_repository.this : repo.name => repo.git_clone_url }
}

output "repo_http_clone_urls" {
  description = "URLs that can be provided to `git clone` to clone the repository via HTTPS."
  value       = { for repo in github_repository.this : repo.name => repo.http_clone_url }
}

output "repo_ssh_clone_urls" {
  description = "URLs that can be provided to `git clone` to clone the repository via SSH."
  value       = { for repo in github_repository.this : repo.name => repo.ssh_clone_url }
}
