
# Day 06 — Terraform Dependencies and Lifecycle

## 1. Dependency

Dependency means one resource depends on another resource.

Terraform uses dependency graphs to determine execution order.

## 2. Implicit Dependency

Terraform automatically detects dependencies through resource references.

Example:

```hcl
resource "local_file" "network" {
  filename = "network.txt"
  content  = "Network"
}

resource "local_file" "application" {
  filename = "application.txt"
  content  = local_file.network.filename
}
```

## 3. Explicit Dependency

Use depends_on when a dependency cannot be inferred from an attribute reference.

```hcl
depends_on = [
  local_file.network
]
```

## 4. Lifecycle Rules

### create_before_destroy

Creates the replacement resource before destroying the old one.

```hcl
lifecycle {
  create_before_destroy = true
}
```

### prevent_destroy

Blocks Terraform from destroying a protected resource while the rule remains in its configuration.

```hcl
lifecycle {
  prevent_destroy = true
}
```

### ignore_changes

Ignores changes to selected attributes.

```hcl
lifecycle {
  ignore_changes = [
    content
  ]
}
```

## 5. Dependency Graph

```bash
terraform graph
```

Generate an image with Graphviz:

```bash
terraform graph | dot -Tpng > dependency-graph.png
```

## 6. Important Commands

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
terraform output
terraform state list
terraform plan -destroy
```

## 7. Advanced: terraform_data

Available in Terraform 1.4+.

```hcl
resource "terraform_data" "example" {
  input = "deployment"

  triggers_replace = [
    "version-2"
  ]
}
```

## 8. Key Learning

- Implicit dependency comes from references.
- Explicit dependency uses depends_on.
- Terraform creates a dependency graph.
- create_before_destroy changes replacement order.
- prevent_destroy protects a configured resource from destruction.
- ignore_changes ignores selected configuration changes.
