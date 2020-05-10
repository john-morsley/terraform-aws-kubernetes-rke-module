#     __      __  _____     _____ 
#     \ \    / / |  __ \   / ____|
#      \ \  / /  | |__) | | |     
#       \ \/ /   |  ___/  | |     
#        \  /    | |      | |____ 
#         \/     |_|       \_____|

module "vpc" {

  source = "./../../../terraform-aws-vpc"

  name = var.vpc_name
  
  cidr_block = var.vpc_cidr_block
  public_subnets = var.vpc_public_subnets
  
}
