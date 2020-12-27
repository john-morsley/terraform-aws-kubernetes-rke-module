#      _____              __  __ 
#     |_   _|     /\     |  \/  |
#       | |      /  \    | \  / |
#       | |     / /\ \   | |\/| |
#      _| |_   / ____ \  | |  | |
#     |_____| /_/    \_\ |_|  |_|
#           _____       _      
#          |  __ \     | |     
#          | |__) |___ | | ___ 
#          |  _  // _ \| |/ _ \
#          | | \ \ (_) | |  __/
#          |_|  \_\___/|_|\___|
#


module "iam-role" {

  source = "./../../../terraform-aws-iam-module"
  #source = "john-morsley/iam/aws"

  name = var.iam_role_name

  assume_role_policy = file("${path.module}/iam/role.json")

  role_policy = file("${path.module}/iam/policy.json")

}