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
#                _____       _    | |  
#               |  __ \     | |   |_|  
#               | |__) |   _| | ___ 
#               |  _  / | | | |/ _ \
#               | | \ \ |_| | |  __/
#               |_|  \_\__,_|_|\___|

module "rke-ingress-sgr" {

  source = "./../../../terraform-aws-security-group-rule-module"
  #source = "john-morsley/security-group-rule/aws"

  description = "Allow all traffic (temp)."

  security_group_id = module.cluster-sg.id

  type      = "ingress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"
  cidrs     = ["0.0.0.0/0"]

}
//
//module "ssh-egress-sgr" {
//
//  source = "./../../../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//
//  description = "Egress for SSH."
//
//  security_group_id = module.allow-ssh-sg.id
//
//  type      = "egress"
//  from_port = 0
//  to_port   = 0
//  protocol  = "-1"
//  cidrs     = ["0.0.0.0/0"]
//
//}

//module "kube-api-ingress-sgr" {
//
//  source = "./../../../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//
//  description = "Ingress for Kube API."
//
//  security_group_id = module.cluster-sg.id
//
//  type      = "ingress"
//  from_port = 6443
//  to_port   = 6443
//  protocol  = "tcp"
//  cidrs     = ["0.0.0.0/0"]
//
//}

//module "kube-api-egress-sgr" {
//
//  source = "./../../../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//
//  description = "Egress for Kube API."
//
//  security_group_id = module.allow-kube-api-sg.id
//
//  type      = "egress"
//  from_port = 0
//  to_port   = 0
//  protocol  = "-1"
//  cidrs     = ["0.0.0.0/0"]
//
//}

//module "http-ingress-sgr" {
//
//  source = "./../../../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//
//  description = "Ingress for HTTP."
//
//  security_group_id = module.cluster-sg.id
//
//  type      = "ingress"
//  from_port = 80
//  to_port   = 80
//  protocol  = "tcp"
//  cidrs     = ["0.0.0.0/0"]
//
//}
//
//module "rke-a-ingress-sgr" {
//
//  source = "./../../../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//
//  description = "Ingress for RKE."
//
//  security_group_id = module.cluster-sg.id
//
//  type      = "ingress"
//  from_port = 2379
//  to_port   = 2380
//  protocol  = "tcp"
//  cidrs     = ["0.0.0.0/0"]
//
//}
//
//module "rke-b-ingress-sgr" {
//
//  source = "./../../../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//
//  description = "Ingress for RKE."
//
//  security_group_id = module.cluster-sg.id
//
//  type      = "ingress"
//  from_port = 10250
//  to_port   = 10250
//  protocol  = "tcp"
//  cidrs     = ["0.0.0.0/0"]
//
//}

module "egress-sgr" {

  source = "./../../../terraform-aws-security-group-rule-module"
  #source = "john-morsley/security-group-rule/aws"

  description = "Egress for HTTP."

  security_group_id = module.cluster-sg.id

  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"
  cidrs     = ["0.0.0.0/0"]

}

# Allow All

//module "allow-all-ingress-sgr" {
//
//  source = "./../../../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//
//  description = "Allow all ingress."
//
//  security_group_id = module.allow-all-sg.id
//
//  type      = "ingress"
//  from_port = 0
//  to_port   = 0
//  protocol  = "-1"
//  //cidrs     = [var.vpc_cidr]
//  cidrs = ["0.0.0.0/0"]
//
//}

//module "allow-all-egress-sgr" {
//
//  source = "./../../../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//
//  description = "Allow all egress."
//
//  security_group_id = module.allow-all-sg.id
//
//  type      = "egress"
//  from_port = 0
//  to_port   = 0
//  protocol  = "-1"
//  //cidrs     = [var.vpc_cidr]
//  cidrs = ["0.0.0.0/0"]
//
//}
