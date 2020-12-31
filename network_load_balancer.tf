#      _   _      _                      _    
#     | \ | |    | |                    | |   
#     |  \| | ___| |___      _____  _ __| | __
#     | . ` |/ _ \ __\ \ /\ / / _ \| '__| |/ /
#     | |\  |  __/ |_ \ V  V / (_) | |  |   < 
#     |_| \_|\___|\__| \_/\_/ \___/|_|  |_|\_\
#           _                     _                         
#          | |                   | |                           
#          | |     ___   __ _  __| |
#          | |    / _ \ / _` |/ _` |
#          | |___| (_) | (_| | (_| |
#          |______\___/ \__,_|\__,_|
#                ____        _                           
#               |  _ \      | |                          
#               | |_) | __ _| | __ _ _ __   ___ ___ _ __ 
#               |  _ < / _` | |/ _` | '_ \ / __/ _ \ '__|
#               | |_) | (_| | | (_| | | | | (_|  __/ |   
#               |____/ \__,_|_|\__,_|_| |_|\___\___|_|   

# https://www.terraform.io/docs/providers/aws/r/lb.html

resource "aws_lb" "node-nlb" {

  name                             = "nodes-nlb"
  internal                         = false
  load_balancer_type               = "network"
  subnets                          = var.public_subnet_ids
  enable_cross_zone_load_balancing = true

  enable_deletion_protection = false
  
  depends_on = [
    module.nodes
  ]
  
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group

resource "aws_lb_target_group" "http" {
  
  name     = "http-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id
  
}

resource "aws_lb_target_group" "https" {

  name     = "https-tg"
  port     = 443
  protocol = "TCP"
  vpc_id   = var.vpc_id
  
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment

resource "aws_lb_target_group_attachment" "http" {
  
  count = length(local.node_data)
  
  target_group_arn = aws_lb_target_group.http.arn
  target_id        = module.nodes[count.index].id
  port             = 80
  
}


resource "aws_lb_target_group_attachment" "https" {

  count = length(local.node_data)
  
  target_group_arn = aws_lb_target_group.https.arn
  target_id        = module.nodes[count.index].id
  port             = 443

}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener

resource "aws_lb_listener" "http" {
  
  load_balancer_arn = aws_lb.node-nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
  
}

resource "aws_lb_listener" "https" {

  load_balancer_arn = aws_lb.node-nlb.arn
  port              = "443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https.arn
  }

}

/*
ToDo:
We need to check that this is working before we continue.
*/