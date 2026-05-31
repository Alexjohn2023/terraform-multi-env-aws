# ============================================================
# locals.tf — Workspace-Aware Configuration Maps
#
# terraform.workspace returns the active workspace name.
# lookup() resolves the right value from each map.
# If someone runs an unknown workspace name, Terraform
# throws a clear error rather than silently using a default.
# ============================================================

locals {

  # ── Instance type per workspace ──────────────────────────
  instance_type_map = {
    dev  = "t2.micro"
    stag = "t2.medium"
    prod = "t3.large"
  }

  # ── Resource name per workspace ──────────────────────────
  instance_name_map = {
    dev  = "web-dev"
    stag = "web-stag"
    prod = "web-prod"
  }

  # ── Resolved values (used in main.tf) ────────────────────
  instance_type = lookup(
    local.instance_type_map,
    terraform.workspace,
    "UNKNOWN_WORKSPACE" # Forces an error if workspace is unrecognised
  )

  instance_name = lookup(
    local.instance_name_map,
    terraform.workspace,
    "UNKNOWN_WORKSPACE"
  )
}
