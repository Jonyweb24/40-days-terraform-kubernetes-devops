
# Navigate to Day 05
cd day-05-terraform-meta-arguments

# Format
terraform fmt -recursive

# Initialize
terraform init

# Validate
terraform validate

# Plan
terraform plan

# Apply
terraform apply

# Outputs
terraform output

# List resources
terraform state list

# Inspect count resource
terraform state show 'local_file.service_inventory[0]'

# Inspect for_each resource
terraform state show 'local_file.service_port_config["frontend"]'

# Test monitoring disabled
terraform plan -var="enable_monitoring=false"

# Test production environment
terraform plan -var="environment=production"

# Inspect generated files
ls -l