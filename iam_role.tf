/*
 _____          __  __   _____       _      
|_   _|   /\   |  \/  | |  __ \     | |     
  | |    /  \  | \  / | | |__) |___ | | ___ 
  | |   / /\ \ | |\/| | |  _  // _ \| |/ _ \
 _| |_ / ____ \| |  | | | | \ \ (_) | |  __/
|_____/_/    \_\_|  |_| |_|  \_\___/|_|\___|

                                          */

module "iam-role" {

  source = "./../terraform-aws-iam-role-module"
  #source = "john-morsley/iam/aws"

  name = "eks-for-${var.cluster_name}"

  assume_role_policy = file("${path.module}/iam/role.json")

  role_policy = file("${path.module}/iam/policy.json")

}