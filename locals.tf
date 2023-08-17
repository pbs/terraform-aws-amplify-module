locals {
  name    = var.name != null ? var.name : var.product
  creator = "terraform"

  enable_basic_auth      = var.basic_auth_configs == null ? null : var.basic_auth_configs.enable
  basic_auth_credentials = var.basic_auth_configs == null ? null : base64encode("${var.basic_auth_configs.username}:${var.basic_auth_configs.password}")

  defaulted_tags = merge(
    var.tags,
    {
      Name                                      = local.name
      "${var.organization}:billing:product"     = var.product
      "${var.organization}:billing:environment" = var.environment
      creator                                   = local.creator
      repo                                      = var.repo
    }
  )

  tags = merge({ for k, v in local.defaulted_tags : k => v if lookup(data.aws_default_tags.common_tags.tags, k, "") != v })
}

data "aws_default_tags" "common_tags" {}
