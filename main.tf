provider "aws" {
  region = var.aws_region
}

module "project" {
  source              = "./modules/"
  vpc_cidr   	      = var.vpc_cidr
  aws_region	      = var.aws_region
  cluster_name        = var.cluster_name
  ecr_image_url       = var.ecr_image_url
  subnets             = module.vpc.public_subnets
  vpc_id              = module.vpc.vpc_id
  security_group_id   = module.vpc.security_group_id
  execution_role_arn  = module.iam.ecs_execution_role_arn
}
