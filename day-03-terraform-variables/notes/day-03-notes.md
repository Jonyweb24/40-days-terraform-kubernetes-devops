
# Day 03 — Terraform Variables and Outputs

## 1. What is a Variable?
A variable is an input value used to make
Terraform configurations reusable and flexible.

## 2. Variable Declaration
variable "project_name" {
  type    = string
  default = "DevOps Project"
}

## 3. Variable Reference
var.project_name

## 4. Data Types
- string: text
- number: numeric value
- bool: true or false
- list: ordered collection
- set: unique collection
- map: key-value collection
- object: structured values
- tuple: fixed-position collection

## 5. Variable Validation
Validation checks whether an input meets
the defined conditions.

## 6. tfvars
terraform.tfvars stores input values separately
from Terraform resource definitions.

## 7. Variable Override
terraform plan -var="environment=testing"

## 8. Variable File
terraform plan -var-file="production.tfvars"

## 9. Environment Variables
export TF_VAR_environment="testing"

## 10. Output
Output exposes useful Terraform results.

Example:
output "project_name" {
  value = var.project_name
}

## 11. Important Commands
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
terraform output
terraform output -json

## 12. Day 3 Project
Created a dynamic DevOps configuration generator
using Terraform variables and outputs.

## 13. Security
Never commit credentials, secrets, state files,
or sensitive tfvars files to GitHub.

Terraform Variables and Outputs - Q&A Notes

What is the difference between variable "environment" and var.environment?
variable "environment" is the declaration block (usually in variables.tf) where you define the variable's name, data type, description, default value, and validation rules. On the other hand, var.environment is the reference expression (used in main.tf or outputs.tf) that retrieves and injects the actual value stored inside that variable.

Why do we use terraform.tfvars?
We use terraform.tfvars to separate actual configuration data from our core infrastructure code. This makes the code reusable across different environments (such as development, staging, and production) simply by changing the values file. It also improves security because terraform.tfvars can be excluded from Git via .gitignore to protect sensitive details, and Terraform automatically loads this file during plan and apply without needing extra command-line flags.

What is the difference between list(string) and map(number)?
list(string) is an ordered collection of text values indexed by position starting from 0 (for example, ["frontend", "backend", "database"], accessed as var.services[0]). In contrast, map(number) is an unordered collection of key-value pairs where every key is a string and every value is a number (for example, { frontend = 3000, backend = 5000 }, accessed by key name like var.service_ports["frontend"]).

What does terraform output do?
terraform output extracts and displays important attributes from your infrastructure (such as generated file paths, ports, IP addresses, or resource IDs) in the terminal after terraform apply completes. It also allows you to query specific values anytime using the CLI (for example, terraform output application_port) or export them in JSON format (terraform output -json) to pass data to scripts, CI/CD pipelines, or other Terraform modules.

Why does running terraform plan -var="environment=testing" use testing instead of development from terraform.tfvars?
Terraform follows a strict Variable Definition Precedence order where values defined later override earlier ones. From lowest to highest priority, Terraform loads environment variables first, then terraform.tfvars, then terraform.tfvars.json, then *.auto.tfvars, and finally command-line flags (-var and -var-file) at the very top. Because -var="environment=testing" is passed as a CLI flag, it has the highest priority and overrides the development value from terraform.tfvars for that run.