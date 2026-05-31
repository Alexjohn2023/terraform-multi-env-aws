# Terraform Workspaces — Dev / Stag / Prod on AWS

One codebase deploying three isolated environments on AWS using Terraform Workspaces, S3 remote state, and native state locking.

## Features
- Terraform Workspaces for full environment isolation
- Dynamic AMI lookup — always latest Ubuntu 24.04 LTS
- S3 remote state with versioning and AES256 encryption
- Native state locking via use_lockfile (Terraform v1.15+)
- Workspace-aware locals with UNKNOWN_WORKSPACE safety net
- Saved plan files with -out flag for safe applies

## Environments
| Workspace | Instance Type | Name     |
|-----------|---------------|----------|
| dev       | t2.micro      | web-dev  |
| stag      | t2.medium     | web-stag |
| prod      | t3.large      | web-prod |

## Author
Alexander Njoku | Cloud and DevOps Engineer
GitHub: https://github.com/Alexjohn2023/terraform-multi-env-aws | Raleigh, NC
