#      _   _           _        __ 
#     | \ | |         | |      /_ |
#     |  \| | ___   __| | ___   | |
#     | . ` |/ _ \ / _` |/ _ \  | |
#     | |\  | (_) | (_| |  __/  | |
#     |_| \_|\___/ \__,_|\___|  |_|

module "node-1" {

  source = "john-morsley/ec2/aws"

  name = local.node_name

  ami = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type

  vpc_id = module.vpc.id

  iam_instance_profile_name = module.iam-role.instance_profile_name

  public_subnet_id = module.vpc.public_subnet_ids[0]

  security_group_ids = [ 
    module.allow-ssh.id 
  ]

  availability_zone = data.aws_availability_zones.available.names[0]
  
  tags = local.cluster_id_tag
  
  bucket_name = local.bucket_name

  docker = true
  
  mock_depends_on = [ 
    module.s3_bucket
  ]
  
}