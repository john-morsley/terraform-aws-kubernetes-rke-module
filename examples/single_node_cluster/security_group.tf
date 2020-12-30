#       _____                      _ _         
#      / ____|                    (_) |        
#     | (___   ___  ___ _   _ _ __ _| |_ _   _ 
#      \___ \ / _ \/ __| | | | '__| | __| | | |
#      ____) |  __/ (__| |_| | |  | | |_| |_| |
#     |_____/ \___|\___|\__,_|_|  |_|\__|\__, |
#            _____                        __/ |
#           / ____|                      |___/ 
#          | |  __ _ __ ___  _   _ _ __  
#          | | |_ | '__/ _ \| | | | '_ \ 
#          | |__| | | | (_) | |_| | |_) |
#           \_____|_|  \___/ \__,_| .__/ 
#                                 | |    
#                                 |_|     

# Allow Kube API

module "allow-kube-api-sg" {

  source = "./../../../terraform-aws-security-group-module"
  #source = "john-morsley/security-group/aws"

  name        = "allow-kube-api-${var.cluster_name}"
  description = "Allow Kube API."

  vpc_id = module.vpc.id

  //  // ingress = [
  //  //   {
  //  //     description = "Allow KupeAPI"
  //  //     from_port   = 6443
  //  //     to_port     = 6443
  //  //     protocol    = "tcp"
  //  //     cidr_blocks = [local.all_cidr_block]
  //  //   }
  //  // ]
  //
  //  // egress = [{
  //  //   description = "Allow All"
  //  //   from_port   = 0
  //  //   to_port     = 0
  //  //   protocol    = "-1"
  //  //   cidr_blocks = [local.all_cidr_block]
  //  // }]

  tags = local.cluster_id_tag

}

# Allow HTTP

module "allow-http-sg" {

  source = "./../../../terraform-aws-security-group-module"
  #source = "john-morsley/security-group/aws"

  name        = "allow-http-for-${var.cluster_name}"
  description = "Allow HTTP."

  vpc_id = module.vpc.id

  tags = local.cluster_id_tag

}
