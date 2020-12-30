#                 __  __   _____
#         /\     |  \/  | |_   _|
#        /  \    | \  / |   | |
#       / /\ \   | |\/| |   | |
#      / ____ \  | |  | |  _| |_
#     /_/    \_\ |_|  |_| |_____|

# Amazon Machine Image

data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"] # Canonical

  # The latest LTS version...
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  # The recommendation is to use HVM:
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}