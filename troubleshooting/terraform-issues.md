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