# Terraform GitHub module

Terraform module which manages your GitHub personal/organization repositories, members and teams.

## Examples

 * [Organization](https://github.com/sh0shin/terraform-module-github/tree/master/examples/organization/main.tf)
 * [Personal](https://github.com/sh0shin/terraform-module-github/blob/master/examples/personal/main.tf)

<!-- TF_DOCS_BEGIN -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement_terraform) (~>0.14)

- <a name="requirement_github"></a> [github](#requirement_github) (~>4.9)

## Providers

The following providers are used by this module:

- <a name="provider_github"></a> [github](#provider_github) (~>4.9)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [github_membership.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/membership) (resource)
- [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) (resource)
- [github_team.child](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) (resource)
- [github_team.root](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) (resource)
- [github_team_membership.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_membership) (resource)
- [github_team_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) (resource)
- [github_user_gpg_key.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/user_gpg_key) (resource)
- [github_user_ssh_key.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/user_ssh_key) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_repositories"></a> [repositories](#input_repositories)

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

### <a name="input_memberships"></a> [memberships](#input_memberships)

Description: Add/remove users from your organization.

Type: `map(string)`

Default: `{}`

### <a name="input_team_childs"></a> [team_childs](#input_team_childs)

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

### <a name="input_team_memberships"></a> [team_memberships](#input_team_memberships)

Description: Add/remove users from teams in your organization.

Type: `map(string)`

Default: `{}`

### <a name="input_team_repositories"></a> [team_repositories](#input_team_repositories)

Description: Manages relationships between teams and repositories in your GitHub organization.

Type: `map(string)`

Default: `{}`

### <a name="input_team_roots"></a> [team_roots](#input_team_roots)

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

### <a name="input_user_gpg_keys"></a> [user_gpg_keys](#input_user_gpg_keys)

Description: Add/remove GPG keys from your user account.

Type:

```hcl
map(object({
    # key = title/name
    armored_public_key = string
  }))
```

Default: `{}`

### <a name="input_user_ssh_keys"></a> [user_ssh_keys](#input_user_ssh_keys)

Description: Add/remove SSH keys from your user account.

Type:

```hcl
map(object({
    # key = title
    key = string
  }))
```

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_repo_git_clone_urls"></a> [repo_git_clone_urls](#output_repo_git_clone_urls)

Description: URLs that can be provided to `git clone` to clone the repository anonymously via the git protocol.

### <a name="output_repo_http_clone_urls"></a> [repo_http_clone_urls](#output_repo_http_clone_urls)

Description: URLs that can be provided to `git clone` to clone the repository via HTTPS.

### <a name="output_repo_ssh_clone_urls"></a> [repo_ssh_clone_urls](#output_repo_ssh_clone_urls)

Description: URLs that can be provided to `git clone` to clone the repository via SSH.

### <a name="output_team_child_ids"></a> [team_child_ids](#output_team_child_ids)

Description: The IDs of the created child teams.

### <a name="output_team_root_ids"></a> [team_root_ids](#output_team_root_ids)

Description: The IDs of the created root teams.
<!-- TF_DOCS_END -->
