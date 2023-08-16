resource "aws_amplify_backend_environment" "environment" {
  count = length(var.backend_environments)

  app_id = aws_amplify_app.app.id

  environment_name = var.backend_environments[count.index].name

  deployment_artifacts = var.backend_environments[count.index].deployment_artifacts
  stack_name           = var.backend_environments[count.index].stack_name
}
