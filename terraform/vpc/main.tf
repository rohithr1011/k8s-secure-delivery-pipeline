module "vpc" {

  source = "terraform-aws-modules/vpc/aws"

  name = "devsecops-vpc"

  cidr = var.vpc_cidr

  azs = [
    "ap-south-1a",
    "ap-south-1b"
  ]

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets

  enable_nat_gateway = true

  single_nat_gateway = true

  enable_dns_hostnames = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}