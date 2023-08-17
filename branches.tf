resource "aws_amplify_branch" "branch" {
  count = length(var.branches)

  app_id = aws_amplify_app.app.id

  branch_name = var.branches[count.index].name

  backend_environment_arn       = var.branches[count.index].backend_environment_arn
  description                   = var.branches[count.index].description
  display_name                  = var.branches[count.index].display_name
  enable_auto_build             = var.branches[count.index].enable_auto_build
  enable_basic_auth             = var.branches[count.index].enable_basic_auth
  basic_auth_credentials        = var.branches[count.index].basic_auth_credentials
  enable_notification           = var.branches[count.index].enable_notification
  enable_performance_mode       = var.branches[count.index].enable_performance_mode
  enable_pull_request_preview   = var.branches[count.index].enable_pull_request_preview
  environment_variables         = var.branches[count.index].environment_variables
  framework                     = var.branches[count.index].framework
  pull_request_environment_name = var.branches[count.index].pull_request_environment_name
  stage                         = var.branches[count.index].stage
  tags = merge(
    local.tags,
    var.branches[count.index].tags,
  )
  ttl = var.branches[count.index].ttl
}
