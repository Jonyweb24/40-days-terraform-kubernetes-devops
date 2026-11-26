variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "service_name" {
  description = "Name of the service"
  type        = string
}

variable "service_port" {
  description = "Port of the service"
  type        = number
}

variable "replicas" {
  description = "Number of service replicas"
  type        = number
}

variable "description" {
  description = "Service description"
  type        = string
}