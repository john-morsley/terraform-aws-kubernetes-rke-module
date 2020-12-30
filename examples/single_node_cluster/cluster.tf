#       _____ _             _      
#      / ____(_)           | |     
#     | (___  _ _ __   __ _| | ___ 
#      \___ \| | '_ \ / _` | |/ _ \
#      ____) | | | | | (_| | |  __/
#     |_____/|_|_| |_|\__, |_|\___|
#             _   _    __/ |  _     
#            | \ | |  |___/  | |
#            |  \| | ___   __| | ___ 
#            | . ` |/ _ \ / _` |/ _ \
#            | |\  | (_) | (_| |  __/
#            |_| \_|\___/ \__,_|\___|
#                 _____ _           _            
#                / ____| |         | |           
#               | |    | |_   _ ___| |_ ___ _ __ 
#               | |    | | | | / __| __/ _ \ '__|
#               | |____| | |_| \__ \ ||  __/ |   
#                \_____|_|\__,_|___/\__\___|_|   

module "single-node-cluster" {

  source = "./../../../terraform-aws-kubernetes-rke"
  //source = "john-morsley/kubernetes-rke/aws"

  vpc_id = module.vpc.id
  public_subnet_ids = module.vpc.public_subnet_ids
  availability_zone_names = data.aws_availability_zones.available.names
  
  cluster_name = var.cluster_name

  bucket_name = module.s3_bucket.name
  
  node_settings = var.node_settings
  
}