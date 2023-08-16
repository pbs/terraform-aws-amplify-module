variable "name" {
  description = "Name of the Amplify app. If null, will default to product."
  type        = string
  default     = null
}

variable "description" {
  description = "Description of the Amplify app."
  type        = string
  default     = null
}

variable "access_token" {
  description = "Personal access token for a third-party source control system for an Amplify app. The personal access token is used to create a webhook and a read-only deploy key. The token is not stored."
  type        = string
  default     = null
}

variable "auto_branch_creation_configs" {
  description = "Automated branch creation configuration for an Amplify app. An auto_branch_creation_config block is documented below."
  type = list(object({
    branch_name                 = optional(string)
    build_spec                  = optional(string)
    enable_auto_build           = optional(bool)
    enable_basic_auth           = optional(bool)
    enable_performance_mode     = optional(bool)
    enable_pull_request_preview = optional(bool)
    environment_variables = list(object({
      name  = string
      value = string
    }))
    framework                     = optional(string)
    pull_request_environment_name = optional(string)
    stage                         = optional(string)
  }))
  default = []
}

variable "basic_auth_configs" {
  description = "Basic authorization credentials for an Amplify app. A basic_auth_config block is documented below."
  type = object({
    enable   = optional(bool, true)
    password = optional(string)
    username = optional(string)
  })
  default = null
}

variable "build_spec" {
  description = "Build specification (build spec) for an Amplify app. The build spec is used to build and deploy a branch of an Amplify app. If not specified, the default build spec for the branch is used. The build spec must be formatted as a JSON string. For more information, see Build Spec Example."
  type        = string
  default     = null
}

variable "custom_rules" {
  description = "Custom rewrite / redirect rules for an Amplify app."
  type = list(object({
    source    = string
    target    = string
    status    = optional(string)
    condition = optional(string)
  }))
  default = []
}

variable "enable_auto_branch_creation" {
  description = "Enable automated branch creation for an Amplify app."
  type        = bool
  default     = null
}

variable "enable_branch_auto_build" {
  description = "Enable automated branch builds for an Amplify app."
  type        = bool
  default     = null
}

variable "enable_branch_auto_deletion" {
  description = "Enable automated branch deletion for an Amplify app."
  type        = bool
  default     = null
}

variable "environment_variables" {
  description = "Environment variables map for an Amplify app."
  type        = map(string)
  default     = null
}

variable "iam_service_role_arn" {
  description = "The AWS Identity and Access Management (IAM) service role for an Amplify app."
  type        = string
  default     = null
}

variable "oauth_token" {
  description = "OAuth token for 3rd party source control system for an Amplify app, used to create webhook and read-only deploy key. OAuth token is not stored."
  type        = string
  default     = null
}

variable "platform" {
  description = "Platform for an Amplify app."
  type        = string
  default     = null
}

variable "repository" {
  description = "Repository for an Amplify app."
  type        = string
  default     = null
}

variable "auto_branch_creation_patterns" {
  description = "Automated branch creation glob patterns for an Amplify app."
  type        = list(string)
  default     = null
}

variable "branches" {
  description = "Branches for an Amplify app."
  type = list(object({
    name                          = string
    backend_environment_arn       = optional(string)
    description                   = optional(bool)
    display_name                  = optional(bool)
    enable_auto_build             = optional(bool)
    enable_basic_auth             = optional(bool)
    basic_auth_credentials        = optional(bool)
    enable_notification           = optional(bool)
    enable_performance_mode       = optional(bool)
    enable_pull_request_preview   = optional(bool)
    environment_variables         = optional(map(string))
    framework                     = optional(string)
    pull_request_environment_name = optional(string)
    stage                         = optional(string)
    tags                          = optional(map(string))
    ttl                           = optional(number)
  }))
  default = []
}

variable "domains" {
  description = "Domains for an Amplify app."
  type = list(object({
    domain_name            = string
    enable_auto_sub_domain = optional(bool)
    wait_for_verification  = optional(bool)
    sub_domains = list(object({
      branch_name = string
      prefix      = string
    }))
  }))
  default = []
}

variable "backend_environments" {
  description = "Backend environments for an Amplify app."
  type = list(object({
    name                 = string
    deployment_artifacts = optional(string)
    stack_name           = optional(string)
  }))
  default = []
}

variable "webhooks" {
  description = "Webhooks for an Amplify app."
  type = list(object({
    branch_name = string
    description = optional(string)
  }))
  default = []
}
