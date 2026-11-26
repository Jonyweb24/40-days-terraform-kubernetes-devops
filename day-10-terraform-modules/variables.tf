variable "project_name" {
  description = "Name of the DevOps project"
  type        = string
  default     = "DevOps Module Project"
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

variable "services" {
  description = "Application services configuration"

  type = map(object({
    port        = number
    replicas    = number
    description = string
  }))

  default = {
    frontend = {
      port        = 3000
      replicas    = 2
      description = "React frontend application"
    }

    backend = {
      port        = 8080
      replicas    = 3
      description = "Node.js backend API"
    }

    database = {
      port        = 5432
      replicas    = 1
      description = "PostgreSQL database"
    }
  }

  validation {
    condition = alltrue([
      for service in values(var.services) :
      service.port >= 1 && service.port <= 65535
    ])

    error_message = "Every service port must be between 1 and 65535."
  }
}