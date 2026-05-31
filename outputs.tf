# ============================================================
# outputs.tf — Useful values printed after apply
# ============================================================

output "workspace" {
  description = "Active Terraform workspace"
  value       = terraform.workspace
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web.id
}

output "instance_type" {
  description = "EC2 instance type deployed"
  value       = aws_instance.web.instance_type
}

output "instance_name" {
  description = "Name tag of the EC2 instance"
  value       = aws_instance.web.tags["Name"]
}

output "ami_id" {
  description = "Ubuntu AMI resolved at apply time"
  value       = data.aws_ami.ubuntu.id
}

output "ami_name" {
  description = "Full AMI name (confirms Ubuntu version)"
  value       = data.aws_ami.ubuntu.name
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = aws_instance.web.public_ip
}
