﻿module "node-1" {

  source = "./../../../terraform-aws-ec2"

  name = var.ec2_name

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type

  vpc_id = module.vpc.vpc_id

  iam_instance_profile_name = module.iam-role.instance_profile_name

  public_subnet_id = module.vpc.public_subnet_id

  security_group_ids = [ module.allow-ssh.id ]

  //  tags = {
  //    "Terraform" = "true"
  //  }

}