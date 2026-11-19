
# Day 04 — Terraform Locals, Functions & Data Sources

## 1. Locals
Locals are named values defined inside Terraform configuration.

Syntax:
```hcl
locals {
  project_name = "ecommerce"
}
```

Reference:
```hcl
local.project_name
```

## 2. Terraform Functions

| Function | Purpose |
|---|---|
| upper() | Convert to uppercase |
| lower() | Convert to lowercase |
| title() | Capitalize words |
| length() | Count items or characters |
| join() | Join list elements |
| format() | Format strings |
| replace() | Replace text |
| tostring() | Convert to string |
| file() | Read file content |
| jsonencode() | Convert value to JSON |

## 3. Data Sources

Data sources read existing information.

Example:
```hcl
data "local_file" "example" {
  filename = "example.txt"
}
```

Reference:
```hcl
data.local_file.example.content
```

## 4. Resource vs Data Source

Resource:
- Creates or manages infrastructure.

Data Source:
- Reads existing information.

## 5. Important Commands

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
terraform output
terraform console
terraform state list
terraform state show data.local_file.deployment_template
```

## 6. Key Learning

- Variables receive input.
- Locals organize and calculate values.
- Functions transform values.
- Data sources read existing information.
- Resources create or manage infrastructure.