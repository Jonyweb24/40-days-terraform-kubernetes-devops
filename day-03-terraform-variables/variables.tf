# 1. Project name
variable "project_name" {
  description = "Name of the DevOps project"
  type        = string
  default     = "DevOps Learning Platform"
}

# 2. Environment

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

# 3. Application name
variable "application_name" {
  description = "Name of the application"
  type        = string
  default     = "devops-api"
}

# 4. Application port

variable "application_port" {
  description = "Port used by the application"
  type        = number
  default     = 3000

  validation {
    condition     = var.application_port >= 1 && var.application_port <= 65535
    error_message = "Application port must be between 1 and 65535."

  }

}

# 5. Monitoring 

variable "enable_monitoring" {
  description = " Enable application Monitoring"
  type        = bool

  default = true

}

#6. services 

variable "services" {
  description = "List of application services"
  type        = list(string)

  default = [
    "frontend",
    "backend",
    "database"
  ]
}

# 7. Service ports

variable "service_ports" {
  description = "Application service ports"
  type        = map(number)

  default = {
    frontend = 3000
    backend  = 5000
    database = 5432
  }
}

#8. Application details

variable "application" {
  description = "Application configuration"

  type = object({
    name       = string
    version    = string
    replicas   = number
    monitoring = bool
  })

  default = {
    name       = "devops-api"
    version    = "1.0.0"
    replicas   = 2
    monitoring = true
  }
}