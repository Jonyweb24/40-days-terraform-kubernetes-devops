
# Day 05 — Terraform Meta-Arguments

## 1. What are Meta-Arguments?

Meta-arguments control how Terraform manages resources.

Today:
- count
- for_each
- Conditional expressions

## 2. count

Creates multiple instances of a resource.

Example:

```hcl
resource "local_file" "example" {
  count    = 3
  filename = "file-${count.index}.txt"
  content  = "File ${count.index}"
}
```

Important:
- count.index starts from 0.
- count = 3 creates 3 instances.
- Resource address uses numeric indexes.

## 3. for_each

Creates resources from a map or set.

Example:

```hcl
resource "local_file" "example" {
  for_each = toset(["frontend", "backend"])

  filename = "${each.key}.txt"
  content  = each.value
}
```

Important:
- each.key identifies the current item.
- each.value returns the current value.
- Map keys must be unique.

## 4. Conditional Expression

Syntax:

```hcl
condition ? true_value : false_value
```

Example:

```hcl
var.environment == "production" ? "HIGH" : "LOW"
```

## 5. Conditional Resource Creation

```hcl
resource "local_file" "monitoring" {
  count = var.enable_monitoring ? 1 : 0

  filename = "monitoring.txt"
  content  = "Monitoring enabled"
}
```

## 6. count vs for_each

| count | for_each |
|---|---|
| Uses a number | Uses map or set |
| Uses count.index | Uses each.key/value |
| Numeric resource identity | Key-based identity |
| Good for identical instances | Good for named instances |

## 7. Important Commands

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
terraform output
terraform state list
terraform state show 'local_file.service_inventory[0]'
```

## 8. Key Learning

- count creates multiple resource instances.
- for_each creates resources using map or set.
- Conditional expressions select values.
- Conditional count can enable or disable resources.
- for_each is generally better for resources with stable names.