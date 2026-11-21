

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
    error_message = "Environment must be one of: development, testing, or production."
  }
}

variable "services" {
  description = "List of application service"
  type        = list(string)

  default = [
    "frontend",
    "backend",
    "database",
    "redis",
    "nginx"
  ]
}

variable "service_ports" {
  description = "Service names and their ports"
  type        = map(number)

  default = {
    frontend = 80
    backend  = 3000
    database = 3305
    redis    = 6379
    nginx    =8080
  }
}

variable "enable_monitoring" {
  description = "Enable monitoring configuration"
  type        = bool
  default     = true
  

}

