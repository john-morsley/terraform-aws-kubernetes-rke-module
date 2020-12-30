#     __      __  _____     _____ 
#     \ \    / / |  __ \   / ____|
#      \ \  / /  | |__) | | |     
#       \ \/ /   |  ___/  | |     
#        \  /    | |      | |____ 
#         \/     |_|       \_____|

module "vpc" {

  source = "./../../../terraform-aws-vpc-module"
  #source = "john-morsley/vpc/aws"

  name = "${var.cluster_name}-vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs

  public_subnet_tags = local.cluster_id_tag

  availability_zones = [data.aws_availability_zones.available.names[0]]

}