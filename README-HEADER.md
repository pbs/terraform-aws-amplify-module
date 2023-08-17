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
