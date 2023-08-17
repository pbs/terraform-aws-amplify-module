output "arn" {
  description = "The ARN of the Amplify App"
  value       = aws_amplify_app.app.arn
}

output "id" {
  description = "The ID of the Amplify App"
  value       = aws_amplify_app.app.id
}

output "name" {
  description = "The name of the Amplify App"
  value       = aws_amplify_app.app.name
}

output "default_domain" {
  description = "The default domain of the Amplify App"
  value       = aws_amplify_app.app.default_domain
}

output "production_branch" {
  description = "The production branch of the Amplify App"
  value       = aws_amplify_app.app.production_branch
}
