output "arn" {
  description = "The ARN of the Amplify App"
  value       = module.amplify_app.arn
}

output "id" {
  description = "The ID of the Amplify App"
  value       = module.amplify_app.id
}

output "name" {
  description = "The name of the Amplify App"
  value       = module.amplify_app.name
}

output "default_domain" {
  description = "The default domain of the Amplify App"
  value       = module.amplify_app.default_domain
}

output "production_branch" {
  description = "The production branch of the Amplify App"
  value       = module.amplify_app.production_branch
}
