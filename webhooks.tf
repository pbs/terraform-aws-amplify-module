resource "aws_amplify_webhook" "hook" {
  count = length(var.webhooks)

  app_id = aws_amplify_app.app.id

  branch_name = var.webhooks[count.index].branch_name
  description = var.webhooks[count.index].description
}
