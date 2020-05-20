#                __          __   _____ 
#         /\     \ \        / /  / ____|
#        /  \     \ \  /\  / /  | (___  
#       / /\ \     \ \/  \/ /    \___ \ 
#      / ____ \     \  /\  /     ____) |
#     /_/    \_\     \/  \/     |_____/ 

provider "aws" {

  access_key = var.access_key
  secret_key = var.secret_key

  region = var.region

}