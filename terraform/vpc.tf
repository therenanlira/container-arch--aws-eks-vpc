module "vpc" {
  source = "../../container-arch--aws-eks-modules/vpc_network"

  environment  = var.environment
  project_name = var.project_name

  cidr_block = var.vpc_cidr
  eks_cidr   = var.eks_cidr
}
