[//]: # ( vim: set ft=markdown : )
# GitHub Terraform module

Terraform module which manages your GitHub personal/organization's repositories, members and teams.

These types of resources are supported:

 * [GitHub membership](https://registry.terraform.io/providers/integrations/github/4.3.0/docs/resources/membership)
 * [GitHub team](https://registry.terraform.io/providers/integrations/github/4.3.0/docs/resources/team)
 * [GitHub team membership](https://registry.terraform.io/providers/integrations/github/4.3.0/docs/resources/team_membership)
 * [GitHub repository](https://registry.terraform.io/providers/integrations/github/4.3.0/docs/resources/repository)
 * [GitHub team repository](https://registry.terraform.io/providers/integrations/github/4.3.0/docs/resources/team_repository)

## Examples

 * [Organization](https://github.com/sh0shin/terraform-module-github/tree/master/examples/organization/main.tf)
 * [Personal](https://github.com/sh0shin/terraform-module-github/blob/master/examples/personal/main.tf)

## Requirements

The following requirements are needed by this module:

- terraform (~>0.14)

- github (=4.3.0)

## Providers

The following providers are used by this module:

- github (=4.3.0)

## Required Inputs

No required input.

## Optional Inputs

The following input variables are optional (have default values):

### github_memberships

Description: Add/remove users from your organization.

Type:

```hcl
map(object({
    role = string
  }))
```

Default: `{}`

### github_repositories

Description: Create and manage repositories within your GitHub organization or personal account.

Type:

```hcl
map(object({
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
```

Default: `{}`

### github_team_members

Description: Add/remove users from teams in your organization.

Type:

```hcl
map(object({
    role = string
  }))
```

Default: `{}`

### github_team_repositories

Description: Manages relationships between teams and repositories in your GitHub organization.

Type:

```hcl
map(object({
    team_name  = string
    permission = string
  }))
```

Default: `{}`

### github_teams

Description: Add/remove teams from your organization.

Type:

```hcl
map(object({
    description = string
    privacy     = string
  }))
```

Default: `{}`

## Outputs

The following outputs are exported:

### repo_git_clone_urls

Description: URLs that can be provided to `git clone` to clone the repository anonymously via the git protocol.

### repo_http_clone_urls

Description: URLs that can be provided to `git clone` to clone the repository via HTTPS.

### repo_ssh_clone_urls

Description: URLs that can be provided to `git clone` to clone the repository via SSH.

### team_ids

Description: The IDs of the created teams.

