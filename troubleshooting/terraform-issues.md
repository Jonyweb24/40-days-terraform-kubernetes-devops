# Terraform Troubleshooting & Solutions Log

A personal log of real-world errors, debugging steps, and solutions encountered during the 40-day DevOps journey.

---

### Issue 01: `cd main.tf` — Not a directory
- **Symptom:** Running `cd main.tf` threw `bash: cd: main.tf: Not a directory`.
- **Root Cause:** `cd` is strictly for navigating directories, whereas `main.tf` is a file.
- **Solution:** Use `cat main.tf` to read file contents, or `code main.tf` to edit in VS Code.

### Issue 02: Git pushing `.tfstate` and `.terraform/` files
- **Symptom:** Running `git status` showed heavy `.terraform/` provider binaries and sensitive `terraform.tfstate` files ready to be tracked.
- **Root Cause:** `.gitignore` was placed inside a subfolder (`projects/`) instead of the repository root (`~/devops-40-days/`).
- **Solution:** Moved `.gitignore` to the root directory and added rules for `**/.terraform/*`, `*.tfstate`, and `*.tfstate.*`.

### Issue 03: GitHub Password Authentication Failed
- **Symptom:** `remote: Invalid username or token. Password authentication is not supported for Git operations.`
- **Root Cause:** GitHub deprecated password-based Git operations over HTTPS.
- **Solution:** Generated a classic Personal Access Token (PAT) with `repo` scope and cached it locally using `git config --global credential.helper store`.

Day-2
# Issue 01: rm main.tf — Is a directory
**Symptom:** Running rm main.tf threw rm: cannot remove 'main.tf': Is a directory.

**Root Cause:** main.tf was accidentally created as a directory (mkdir main.tf) instead of a file (touch main.tf).

**Solution:** Removed the directory forcefully using rm -rf main.tf, and recreated main.tf properly as a configuration file.

**Issue 02:** Cleaning Up Local Terraform Cache & Lock Files
**Symptom:** Needed a clean slate to re-initialize Terraform providers after modifying or resetting the configuration setup.

**Root Cause:** The .terraform/ provider cache directory and .terraform.lock.hcl file persisted from previous terraform init runs.

**Solution:** Deleted the cache and lock file using rm -rf .terraform .terraform.lock.hcl, then ran terraform init to rebuild them cleanly.

## Issue 03: terraform plan Notice Regarding -out Option
**Symptom:** Running terraform plan displayed: Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

**Root Cause:** Informational notice indicating the execution plan was only printed to the terminal and not saved to a binary plan file.

**Solution:** For guaranteed execution in production/CI workflows, save the plan using terraform plan -out=tfplan and execute it with terraform apply tfplan (ensure *.tfplan is added to .gitignore).

## Issue 04: "content_base64": null in Terraform State
Symptom: Inspecting the applied local_file resources showed "content_base64": null in the state output.

**Root Cause:** Standard behavior—content (plain text) was used in main.tf instead of content_base64 (used for binary or base64-encoded data), leaving the unused attribute as null.

**Solution:** No fix required; verified file contents directly in the terminal using cat <filename>.

## Issue 05: Viewing terraform-graph.png Inside WSL2
**Symptom:** Generated the dependency graph (terraform-graph.png), which cannot be rendered directly inside the headless WSL2 terminal.

**Root Cause:** WSL2 CLI lacks a native terminal image viewer by default unless bridged to Windows GUI apps.

**Solution:** Opened the generated PNG directly in the Windows default image viewer from WSL2 using explorer.exe terraform-graph.png.
## DAy 3

# Day 03 — Terraform Variables, Outputs & Git Troubleshooting Log

## 1. Typo & Syntax Errors in `outputs.tf`

**Issue:** Invalid argument name and undeclared variable reference inside `outputs.tf`.

**Symptom:**
```text
Error: Unsupported argument (valur)
Error: Reference to undeclared input variable (var.sercice_ports)
Root Cause: Minor spelling mistakes in outputs.tf — valur was written instead of value, and var.sercice_ports was referenced instead of var.service_ports.

Solution:

Replaced valur with value in the application_port output block.

Corrected var.sercice_ports to var.service_ports to match variables.tf.

Verified the syntax using terraform fmt and terraform validate.

2. Invalid validation Block Syntax in variables.tf
Issue: Incorrect argument formatting inside the application_port variable validation block.

Symptom:

Plaintext
Error: Missing required argument: The argument "error_message" is required, but no definition was found.
Error: Unsupported argument: An argument named "error-message" is not expected here. Did you mean "error_message"?
Root Cause: Used a hyphen (error-message) instead of an underscore (error_message) inside the validation block.

Solution: Updated the validation block in variables.tf to use error_message with an underscore:

Terraform
validation {
  condition     = var.application_port >= 1 && var.application_port <= 65535
  error_message = "Application port must be between 1 and 65535."
}
3. Missing Required Provider (hashicorp/local)
Issue: Terraform failed to validate or execute configuration due to a missing local provider plugin.

Symptom:

Plaintext
Error: Missing required provider
This configuration requires provider registry.terraform.io/hashicorp/local, but that provider isn't available.
Root Cause: Working inside a new project directory (day-03-terraform-variables) where the required provider plugin had not yet been downloaded and initialized.

Solution: Ran terraform init inside day-03-terraform-variables to download and install the hashicorp/local provider before running terraform validate and terraform apply.

4. terraform apply Showing 0 added Instead of 3 added
Issue: Running terraform apply reported zero resources added despite expecting fresh file generation.

Symptom:

Plaintext
No changes. Your infrastructure matches the configuration.
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
Root Cause: Terraform tracks resource state in terraform.tfstate. Because the three .txt files were already generated on a previous run and matched the current code, Terraform skipped recreating them.

Solution: Removed the generated .txt files (rm project-summary.txt deployment-config.txt infrastructure-details.txt) or ran terraform destroy first, then executed terraform apply -auto-approve to observe Resources: 3 added.

5. Generated .txt and Lock Files Appearing in git status
Issue: Auto-generated output files and Terraform lock files were tracked or staged by Git.

Symptom: After running git add ., generated files (*.txt) and .terraform.lock.hcl appeared as staged/untracked files in git status.

Root Cause: .gitignore lacked rules to ignore generated .txt output files and lock files, or files were staged before updating .gitignore.

Solution:

Unstaged all staged files using git reset.

Added *.txt, *.tfvars, *.tfstate*, .terraform/, and .terraform.lock.hcl to .gitignore.

Verified ignore rules using git check-ignore -v day-03-terraform-variables/terraform.tfvars.

Re-staged and committed only source code, .tfvars.example, and documentation files.


----
DAY-05:
# Day 05 Troubleshooting & Lessons Learned

## 1. Wrong Namespace in `service_inventory_files` Output
- **Symptom / Issue**: Referencing `local.service_inventory_files[*].filename` when `service_inventory_files` is a `local_file` resource rather than a local value in `locals.tf`.
- **Root Cause**: Mismatched Terraform reference namespace (`local.*` vs. `local_file.*`).
- **Fix**: Reference the resource directly: `local_file.service_inventory[*].filename`.

## 2. Conditional Index Access on `monitoring_config`
- **Symptom / Issue**: Direct indexing like `local_file.monitoring_config[0].filename` can be risky when `count` evaluates to `0` (`enable_monitoring = false`) during plan or refactoring edge cases.
- **Root Cause**: Accessing index `0` on a zero-length resource collection.
- **Fix**: Wrap the lookup safely using `try(local_file.monitoring_config[0].filename, "Monitoring disabled")`.

## 3. `-var` Flag Reverts on Subsequent `terraform apply`
- **Symptom / Issue**: Running `terraform apply -var="enable_monitoring=false"` showed `monitoring_status` changing from `"ENABLED"` to `"DISABLED"`, but a later plain `terraform apply` showed `"ENABLED"` again.
- **Root Cause**: Command-line `-var` flags only override variables for that single invocation; `variables.tf` still had `default = true` (and the earlier apply wasn't completed/confirmed).
- **Fix**: Set `default = false` in `variables.tf` or define `enable_monitoring = false` in `terraform.tfvars` for persistent behavior, and confirm `yes` when applying changes.

## 4. `count` Index Shifting When Removing List Elements
- **Symptom / Issue**: Removing an item from the middle of a list (e.g., `"backend"` from `["frontend", "backend", "database"]`) shifts indices (`[1]` becomes `"database"`), risking unintended updates or replacements.
- **Root Cause**: `count` tracks resource instances by numeric index rather than item identity.
- **Fix**: Use `for_each = toset(var.services)` (or a map) when items have distinct identities so removing one element does not shift other keys.

## 5. Lab Folder Created Outside the Cloned Git Repository
- **Symptom / Issue**: The `day-05-terraform-meta-arguments` directory was created outside `40-days-terraform-kubernetes-devops`.
- **Root Cause**: Creating a standalone lab folder before opening/cloning the target Git repository.
- **Fix*: Clone the repository, copy the folder inside using `cp -r`, then run `git add`, `git commit`, and `git push origin main`
