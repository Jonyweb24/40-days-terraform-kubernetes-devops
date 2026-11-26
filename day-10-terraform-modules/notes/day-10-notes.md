# Day 10 - Terraform Modules

## Topics
- Terraform Modules
- Root Module
- Child Module
- Module Source
- Module Inputs
- Module Outputs
- Module with for_each
- Module State Address

## Project
Reusable DevOps Service Generator

## What I Learned
1. Module helps reuse Terraform code.
2. Root Module calls Child Modules.
3. Variables pass input values.
4. Outputs return values.
5. for_each can create multiple module instances.
6. Child modules share the root state by default.

## Commands
- terraform init
- terraform fmt -recursive
- terraform validate
- terraform plan
- terraform apply
- terraform output
- terraform state list
- terraform state show

## Project Result
Generated three service configuration files:
- frontend-config.txt
- backend-config.txt
- database-config.txt