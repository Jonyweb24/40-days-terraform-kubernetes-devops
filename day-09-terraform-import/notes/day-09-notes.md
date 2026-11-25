
# Day 09 - Terraform Import Existing Resources

## 1. What is Terraform Import?

Terraform Import brings an existing supported
resource into Terraform State.

## 2. Why Import?

- Existing infrastructure management
- Brownfield infrastructure adoption: having from cloud consol or running by manual scripted
- Avoid unnecessary resource recreation
- Infrastructure as Code migration

## 3. CLI Import

terraform import RESOURCE_ADDRESS RESOURCE_ID

Example:

terraform import random_integer.legacy_port "15432,10000,20000"

## 4. Import Block

import {
  to = random_integer.managed_port
  id = "15433,10000,20000"
}

Commands:

terraform plan
terraform apply

## 5. Important Concepts

- Resource address
- Provider-specific import ID
- State registration
- Configuration matching
- Import plan review

## 6. Import Limitations

- Not every provider resource supports import.
- Import does not automatically create complete HCL.
- One remote object should map to one resource address.
- Configuration must match existing infrastructure.

## 7. Verification

terraform state list
terraform state show random_integer.legacy_port
terraform plan

## 8. Best Practices

- Backup State before import.
- Verify the resource ID.
- Check provider import documentation.
- Review plan before apply.
- Never blindly apply replacement plans.
