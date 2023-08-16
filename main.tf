resource "aws_amplify_app" "app" {
  name        = local.name
  description = var.description

  access_token = var.access_token
  oauth_token  = var.oauth_token

  dynamic "auto_branch_creation_config" {
    for_each = var.auto_branch_creation_configs

    content {
      basic_auth_credentials        = auto_branch_creation_config.value.basic_auth_credentials
      build_spec                    = auto_branch_creation_config.value.build_spec
      enable_auto_build             = auto_branch_creation_config.value.enable_auto_build
      enable_basic_auth             = auto_branch_creation_config.value.enable_basic_auth
      enable_performance_mode       = auto_branch_creation_config.value.enable_performance_mode
      enable_pull_request_preview   = auto_branch_creation_config.value.enable_pull_request_preview
      environment_variables         = auto_branch_creation_config.value.environment_variables
      framework                     = auto_branch_creation_config.value.framework
      pull_request_environment_name = auto_branch_creation_config.value.pull_request_environment_name
      stage                         = auto_branch_creation_config.value.stage
    }
  }

  auto_branch_creation_patterns = var.auto_branch_creation_patterns

  dynamic "custom_rule" {
    for_each = var.custom_rules

    content {
      condition = custom_rule.value.condition
      source    = custom_rule.value.source
      status    = custom_rule.value.status
      target    = custom_rule.value.target
    }
  }

  enable_basic_auth      = local.enable_basic_auth
  basic_auth_credentials = local.basic_auth_credentials

  build_spec                  = var.build_spec
  enable_auto_branch_creation = var.enable_auto_branch_creation
  enable_branch_auto_build    = var.enable_branch_auto_build
  enable_branch_auto_deletion = var.enable_branch_auto_deletion
  environment_variables       = var.environment_variables
  iam_service_role_arn        = var.iam_service_role_arn
  platform                    = var.platform
  repository                  = var.repository

  tags = local.tags
}
