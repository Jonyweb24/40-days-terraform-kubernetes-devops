variable "lab_topic" {
  description = "Focus topic for Day 7 lab"
  type        = string
  default     = "Terraform Modules and Workflow"
}

variable "environment" {
  description = "Target environment label"
  type        = string
  default     = "local-dev"
}

variable "output_filename" {
  description = "Generated file name inside the Day 7 folder"
  type        = string
  default     = "day07-output.txt"
}