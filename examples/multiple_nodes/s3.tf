#       _____   ____      
#      / ____| |___ \    
#     | (___     __) |  
#      \___ \   |__ <  
#      ____) |  ___) |  
#     |_____/  |____/  

module "s3_bucket" {

  source = "./../../../terraform-aws-s3-bucket"
  #source = "john-morsley/s3-bucket/aws"

  name = local.bucket_name

}