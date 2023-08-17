resource "aws_amplify_domain_association" "domain" {
  count = length(var.domains)

  app_id = aws_amplify_app.app.id

  domain_name            = var.domains[count.index].domain_name
  enable_auto_sub_domain = var.domains[count.index].enable_auto_sub_domain
  wait_for_verification  = var.domains[count.index].wait_for_verification

  dynamic "sub_domain" {
    for_each = var.domains[count.index].sub_domains

    content {
      branch_name = sub_domain.value.branch_name
      prefix      = sub_domain.value.prefix
    }
  }
}
