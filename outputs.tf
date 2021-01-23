# vim: set ft=terraform :

output "github_team_ids" {
  value = { for team in github_team.this : team.name => team.id }
}
