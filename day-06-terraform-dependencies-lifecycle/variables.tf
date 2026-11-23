variable "project_name" {
  description = "Name of th DevOps project"
  type        = string
  default     = "ecommerce"
}

variable "environment" {
  description = "Deployment environement"
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

variable "release_filename" {
  description = "Name of the release manifest file"
  type        = string
  default     = "release-v1.txt"
}

variable "release_version" {
  description = "Application release version"
  type        = string
  default     = "1.0.0"
}

variable "manual_note_content" {
  description = "Content of the manually managed notes file"
  type        = string
  default     = "Initial deployment note"
}
