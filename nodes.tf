/*
 _   _           _           
| \ | |         | |          
|  \| | ___   __| | ___  ___ 
| . ` |/ _ \ / _` |/ _ \/ __|
| |\  | (_) | (_| |  __/\__ \
|_| \_|\___/ \__,_|\___||___/

                           */

module "nodes" {

  source = "./../terraform-aws-ec2-module"
  #source = "john-morsley/ec2/aws"

  count = length(var.node_settings)

  name = "${var.cluster_name}-node-${count.index + 1}"

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.node_settings[count.index].instance_type

  vpc_id = var.vpc_id

  iam_instance_profile_name = module.iam-role.instance_profile_name

  // Shouldn't these be in the private subnet?
  public_subnet_id = var.public_subnet_ids[0] // Randomise?

  additional_security_group_ids = [
    module.cluster-sg.id,
  ]

  availability_zone = var.availability_zone_names[0] // Randomise?

  bucket_prefix = "morsley-io"

  tags = local.cluster_id_tag

  docker = true

}