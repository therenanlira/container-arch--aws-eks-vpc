locals {
  tags = {
    Project     = var.project_name
    Region      = var.region
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "SRE Team"
  }
}
