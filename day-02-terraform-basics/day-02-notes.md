
# Day 02 — HCL, Providers and Resources

## 1. What is HCL?
HCL means HashiCorp Configuration Language.
Terraform uses HCL to define infrastructure.

## 2. Declarative Language
Declarative configuration defines the desired state.
Terraform decides how to achieve that state.

## 3. Provider
A provider connects Terraform with an external platform.

Examples:
- AWS
- Azure
- Kubernetes
- Local
- Docker

## 4. required_providers
Defines provider source and version constraints.

## 5. Provider Block
Configures the provider.

Example:
provider "local" {}

## 6. Resource
A resource represents an object managed by Terraform.

Syntax:
resource "TYPE" "NAME" {}

## 7. Resource Address
Format:
resource_type.resource_name

Example:
local_file.project_info

## 8. Arguments
Arguments configure a resource.

Example:
filename = "hello.txt"
content = "Hello DevOps"

## 9. Implicit Dependency
When one resource references another resource,
Terraform can determine the dependency automatically.

## 10. Terraform Workflow
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply

## 11. State Commands
terraform state list
terraform state show
terraform show

## 12. Day 2 Practical
Created four local files using Terraform.
Practiced resource references and dependencies.
Practiced plan, apply and debugging.



## Core Terraform Concepts (Q&A)

### 1. Difference Between `required_providers` and `provider` Blocks
* **`required_providers` Block:**
  * **What it is:** The "download list." It tells Terraform *which* provider plugin (like AWS, Azure, or Local) to download from the registry and *what version* to use.
  * **Where it lives:** Inside the `terraform { ... }` block.
* **`provider` Block:**
  * **What it is:** The "login and settings." It configures how Terraform connects to the provider (e.g., region, access keys, or credentials).
  * **Where it lives:** At the root level of your code (e.g., `provider "local" {}`).

---

### 2. What Do `local_file` and `project_info` Mean?
```hcl
resource "local_file" "project_info" {
  filename = "project.txt"
  content  = "DevOps"
}
  local_file (Resource Type): Tells Terraform what kind of thing you want to create. Here, local is the provider and file is the resource type (meaning: create a file on your local machine).

project_info (Resource Local Name): A custom nickname or ID that you give to this specific resource so you can refer to it elsewhere in your Terraform code. (Note: This is not the actual file name on your hard drive; the actual file name is set by filename = "project.txt").

3. Difference Between terraform plan and terraform apply
terraform plan (The Preview / Dry Run):

It scans your configuration files, compares them with the current state, and shows you a preview of what will be added (+), changed (~), or deleted (-).

It does not make any actual changes.

terraform apply (The Execution):

It takes the plan and actually builds or modifies the real infrastructure on your computer or cloud, and updates the terraform.tfstate file.

4. What is local_file.project_info?
It is the Full Resource Address (resource_type.resource_name).

You use this address anywhere in your Terraform code when you need to access details (attributes) of that specific file—such as local_file.project_info.id or local_file.project_info.filename.

5. How Terraform Understands Dependencies via Attribute Referencing
Implicit Dependency: When Resource B uses an attribute from Resource A (for example, content = local_file.project_info.id), Terraform automatically detects the connection.

How it works: Terraform builds a dependency graph (DAG) in the background. It realizes, "I cannot build Resource B until Resource A exists because B needs A's ID." Therefore, it automatically creates Resource A first, gets its data, and then creates Resource B.