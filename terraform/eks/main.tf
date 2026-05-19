data "terraform_remote_state" "vpc" {

  backend = "local"

  config = {
    path = "../vpc/terraform.tfstate"
  }
}

module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.31"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {

    dev = {

      desired_size = 2
      max_size     = 3
      min_size     = 1

      instance_types = ["t3.medium"]

      capacity_type = "ON_DEMAND"
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}