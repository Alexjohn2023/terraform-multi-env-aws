# ============================================================
# main.tf — Terraform Workspaces Demo
# Author : Alexander Njoku (@alex2020global)
# Purpose: One codebase → dev / stag / prod on AWS
#          Each workspace gets isolated state + config
# ============================================================

# ── Dynamic AMI lookup (always latest Ubuntu 24.04 LTS) ────
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical official account

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# ── EC2 Instance ────────────────────────────────────────────
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_type

  tags = {
    Name        = local.instance_name
    Environment = terraform.workspace
    Project     = "terraform-workspaces-demo"
    ManagedBy   = "Terraform"
    Owner       = "Alexander Njoku"
    AMI_Used    = data.aws_ami.ubuntu.id
  }
}
