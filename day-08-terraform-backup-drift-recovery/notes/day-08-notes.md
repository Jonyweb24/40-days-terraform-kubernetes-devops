
# Day 08 - Terraform State Backup, Drift & Recovery

## 1. State Backup

State backup is a copy of the current Terraform State.

Command:
terraform state pull > backups/day-08-state-backup.json

## 2. State Metadata

- Serial: State revision counter.
- Lineage: Unique State identity.

## 3. Infrastructure Drift

Drift happens when real infrastructure changes
outside Terraform configuration.

Examples:
- Manual AWS Console changes
- External automation
- Manual resource deletion

## 4. Drift Detection

terraform plan

## 5. Refresh-only Workflow

terraform plan -refresh-only

terraform apply -refresh-only

## 6. State Recovery

- Take backup first.
- Stop concurrent Terraform operations.
- Verify lineage and serial.
- Follow backend-specific recovery steps.
- Run terraform plan after recovery.

## 7. Security

- Never commit State files.
- Never commit State backups.
- Use secure remote backend.
- Control access to State.
- Use backend locking where supported.