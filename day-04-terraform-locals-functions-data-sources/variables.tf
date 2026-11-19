variable "project_name" {
  description = "Name of the DevOps project"
  type        = string
  default     = "ecommerce"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"

  validation {
    condition = contains(
      ["development", "testing", "production"],
      var.environment
    )
    error_message = "Environment must be development, testing, or production."
  }
}

variable "application_version" {
  description = "Application version"
  type        = string
  default     = "1.0.0"
}

variable "services" {
  description = "Application services"
  type        = list(string)

  default = [
    "frontend",
    "backend",
    "database",
    "redis"
  ]
}

variable "application_port" {
  description = "Application port"
  type        = number
  default     = 3000
}

variable "enable_monitoring" {
  description = "Enable application enable monitoring"
  type        = bool
  default     = true
}
