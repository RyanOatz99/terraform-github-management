[//]: # ( vim: set ft=markdown : )
# GitHub Terraform module

Terraform module which manages your GitHub personal/organization's repositories, members and teams.

**WARNING**  
Version 0.0.6: Variables were redesigned!

These types of resources are supported:

 * [GitHub membership](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/membership)
 * [GitHub team](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team)
 * [GitHub team membership](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_membership)
 * [GitHub repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)
 * [GitHub team repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository)

 * [GitHub user's GPG](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/user_gpg_key)
 * [GitHub user's SSH key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/user_ssh_key)

## Examples

 * [Organization](https://github.com/sh0shin/terraform-module-github/tree/master/examples/organization/main.tf)
 * [Personal](https://github.com/sh0shin/terraform-module-github/blob/master/examples/personal/main.tf)

## Requirements

The following requirements are needed by this module:

- terraform (~>0.14)

- github (=4.4.0)

## Providers

The following providers are used by this module:

- github (=4.4.0)

## Required Inputs

The following input variables are required:

### repositories

Description: Create and manage repositories within your GitHub organization or personal account.

Type:

```hcl
map(object({
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
```

## Optional Inputs

The following input variables are optional (have default values):

### user_ssh_keys

Description: Add/remove SSH keys from your user account.

Type:

```hcl
map(object({
    # key = title
    key = string
  }))
```

Default: `{}`

### user_gpg_keys

Description: Add/remove GPG keys from your user account.

Type:

```hcl
map(object({
    # key = title/name
    armored_public_key = string
  }))
```

Default: `{}`

### memberships

Description: Add/remove users from your organization.

Type: `map(string)`

Default: `{}`

### team_roots

Description: Add/remove teams from your organization.

Type:

```hcl
map(object({
    # key = name
    description = string
    privacy     = string # must be closed for childs
    maintainer  = bool
  }))
```

Default: `{}`

### team_childs

Description: Add/remove teams with parent from your organization.

Type:

```hcl
map(object({
    # key = name
    description = string
    parent_team = string
    maintainer  = bool
  }))
```

Default: `{}`

### team_memberships

Description: Add/remove users from teams in your organization.

Type: `map(string)`

Default: `{}`

### team_repositories

Description: Manages relationships between teams and repositories in your GitHub organization.

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### team_root_ids

Description: The IDs of the created root teams.

### team_child_ids

Description: The IDs of the created child teams.

### repo_git_clone_urls

Description: URLs that can be provided to `git clone` to clone the repository anonymously via the git protocol.

### repo_http_clone_urls

Description: URLs that can be provided to `git clone` to clone the repository via HTTPS.

### repo_ssh_clone_urls

Description: URLs that can be provided to `git clone` to clone the repository via SSH.

