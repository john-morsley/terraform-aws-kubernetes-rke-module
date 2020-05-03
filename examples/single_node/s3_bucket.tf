#       _____   ____    ____             _        _   
#      / ____| |___ \  |  _ \           | |      | |  
#     | (___     __) | | |_) |_   _  ___| | _____| |_ 
#      \___ \   |__ <  |  _ <| | | |/ __| |/ / _ \ __|
#      ____) |  ___) | | |_) | |_| | (__|   <  __/ |_ 
#     |_____/  |____/  |____/ \__,_|\___|_|\_\___|\__|
#                                                     

module "s3_bucket" {

  source = "./../../../terraform-aws-s3-bucket"
  #source = "john-morsley/terraform-aws-vpc"

  name = local.bucket_name

//  tags = {
//    Owner = "john-doe"
//  }

}