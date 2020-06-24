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

resource "aws_lb_target_group" "this" {
  name     = "one-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = module.vpc.id
}

resource "aws_lb_target_group_attachment" "one" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = module.node-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "two" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = module.node-2.id
  port             = 80
}

resource "aws_lb" "this" {

  name                             = "test-nlb"
  internal                         = false
  load_balancer_type               = "network"
  subnets                          = module.vpc.public_subnet_ids
  enable_cross_zone_load_balancing = true

  enable_deletion_protection = false

  #  tags = {
  #    Environment = "production"
  #  }

}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
