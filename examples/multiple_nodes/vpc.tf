#     __      __  _____     _____ 
#     \ \    / / |  __ \   / ____|
#      \ \  / /  | |__) | | |     
#       \ \/ /   |  ___/  | |     
#        \  /    | |      | |____ 
#         \/     |_|       \_____|

module "vpc" {

  source = "./../../../terraform-aws-vpc"
  #source = "john-morsley/vpc/aws"

  name = local.name

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs

  public_subnet_tags = local.cluster_id_tag

  availability_zones = [data.aws_availability_zones.available.names[0]]

}