# PBS TF Amplify Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-amplify-module?ref=x.y.z
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

Provisions an Amplify application.

The recommended usage for this module is to avoid populating any `token` input variables and to import an Amplify application that was created in the AWS console. This will allow you to avoid the need to handle managing the secure usage of a token with Terraform.

Integrate this module like so:

```hcl
module "amplify" {
  source = "github.com/pbs/terraform-aws-amplify-module?ref=x.y.z"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

The easiest way to use this module is to use the AWS console to create an Amplify application and then import it into Terraform using the [import utility](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_app#import).

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_amplify_app.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_app) | resource |
| [aws_amplify_backend_environment.environment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_backend_environment) | resource |
| [aws_amplify_branch.branch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_branch) | resource |
| [aws_amplify_domain_association.domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_domain_association) | resource |
| [aws_amplify_webhook.hook](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_webhook) | resource |
| [aws_default_tags.common_tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/default_tags) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (sharedtools, dev, staging, qa, prod) | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Organization using this module. Used to prefix tags so that they are easily identified as being from your organization | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Tag used to group resources according to product | `string` | n/a | yes |
| <a name="input_repo"></a> [repo](#input\_repo) | Tag used to point to the repo using this module | `string` | n/a | yes |
| <a name="input_access_token"></a> [access\_token](#input\_access\_token) | Personal access token for a third-party source control system for an Amplify app. The personal access token is used to create a webhook and a read-only deploy key. The token is not stored. | `string` | `null` | no |
| <a name="input_auto_branch_creation_configs"></a> [auto\_branch\_creation\_configs](#input\_auto\_branch\_creation\_configs) | Automated branch creation configuration for an Amplify app. An auto\_branch\_creation\_config block is documented below. | <pre>list(object({<br>    branch_name                 = optional(string)<br>    build_spec                  = optional(string)<br>    enable_auto_build           = optional(bool)<br>    enable_basic_auth           = optional(bool)<br>    enable_performance_mode     = optional(bool)<br>    enable_pull_request_preview = optional(bool)<br>    environment_variables = list(object({<br>      name  = string<br>      value = string<br>    }))<br>    framework                     = optional(string)<br>    pull_request_environment_name = optional(string)<br>    stage                         = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_auto_branch_creation_patterns"></a> [auto\_branch\_creation\_patterns](#input\_auto\_branch\_creation\_patterns) | Automated branch creation glob patterns for an Amplify app. | `list(string)` | `null` | no |
| <a name="input_backend_environments"></a> [backend\_environments](#input\_backend\_environments) | Backend environments for an Amplify app. | <pre>list(object({<br>    name                 = string<br>    deployment_artifacts = optional(string)<br>    stack_name           = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_basic_auth_configs"></a> [basic\_auth\_configs](#input\_basic\_auth\_configs) | Basic authorization credentials for an Amplify app. A basic\_auth\_config block is documented below. | <pre>object({<br>    enable   = optional(bool, true)<br>    password = optional(string)<br>    username = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_branches"></a> [branches](#input\_branches) | Branches for an Amplify app. | <pre>list(object({<br>    name                          = string<br>    backend_environment_arn       = optional(string)<br>    description                   = optional(bool)<br>    display_name                  = optional(bool)<br>    enable_auto_build             = optional(bool)<br>    enable_basic_auth             = optional(bool)<br>    basic_auth_credentials        = optional(bool)<br>    enable_notification           = optional(bool)<br>    enable_performance_mode       = optional(bool)<br>    enable_pull_request_preview   = optional(bool)<br>    environment_variables         = optional(map(string))<br>    framework                     = optional(string)<br>    pull_request_environment_name = optional(string)<br>    stage                         = optional(string)<br>    tags                          = optional(map(string))<br>    ttl                           = optional(number)<br>  }))</pre> | `[]` | no |
| <a name="input_build_spec"></a> [build\_spec](#input\_build\_spec) | Build specification (build spec) for an Amplify app. The build spec is used to build and deploy a branch of an Amplify app. If not specified, the default build spec for the branch is used. The build spec must be formatted as a JSON string. For more information, see Build Spec Example. | `string` | `null` | no |
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | Custom rewrite / redirect rules for an Amplify app. | <pre>list(object({<br>    source    = string<br>    target    = string<br>    status    = optional(string)<br>    condition = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the Amplify app. | `string` | `null` | no |
| <a name="input_domains"></a> [domains](#input\_domains) | Domains for an Amplify app. | <pre>list(object({<br>    domain_name            = string<br>    enable_auto_sub_domain = optional(bool)<br>    wait_for_verification  = optional(bool)<br>    sub_domains = list(object({<br>      branch_name = string<br>      prefix      = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_enable_auto_branch_creation"></a> [enable\_auto\_branch\_creation](#input\_enable\_auto\_branch\_creation) | Enable automated branch creation for an Amplify app. | `bool` | `null` | no |
| <a name="input_enable_branch_auto_build"></a> [enable\_branch\_auto\_build](#input\_enable\_branch\_auto\_build) | Enable automated branch builds for an Amplify app. | `bool` | `null` | no |
| <a name="input_enable_branch_auto_deletion"></a> [enable\_branch\_auto\_deletion](#input\_enable\_branch\_auto\_deletion) | Enable automated branch deletion for an Amplify app. | `bool` | `null` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Environment variables map for an Amplify app. | `map(string)` | `null` | no |
| <a name="input_iam_service_role_arn"></a> [iam\_service\_role\_arn](#input\_iam\_service\_role\_arn) | The AWS Identity and Access Management (IAM) service role for an Amplify app. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Amplify app. If null, will default to product. | `string` | `null` | no |
| <a name="input_oauth_token"></a> [oauth\_token](#input\_oauth\_token) | OAuth token for 3rd party source control system for an Amplify app, used to create webhook and read-only deploy key. OAuth token is not stored. | `string` | `null` | no |
| <a name="input_platform"></a> [platform](#input\_platform) | Platform for an Amplify app. | `string` | `null` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Repository for an Amplify app. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Extra tags | `map(string)` | `{}` | no |
| <a name="input_webhooks"></a> [webhooks](#input\_webhooks) | Webhooks for an Amplify app. | <pre>list(object({<br>    branch_name = string<br>    description = optional(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the Amplify App |
| <a name="output_default_domain"></a> [default\_domain](#output\_default\_domain) | The default domain of the Amplify App |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Amplify App |
| <a name="output_name"></a> [name](#output\_name) | The name of the Amplify App |
| <a name="output_production_branch"></a> [production\_branch](#output\_production\_branch) | The production branch of the Amplify App |
