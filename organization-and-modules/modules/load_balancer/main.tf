resource "aws_lb_target_group" "tg" {
  name        = var.target_group_name
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "CustomTGAttach" {
  count            = length(var.target_instance_ids)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.target_instance_ids[count.index]
  port             = var.target_group_port
}

resource "aws_lb" "elb" {
  name            = var.lb_name
  subnets         = var.subnet_ids
  security_groups = [var.security_group_id]
  tags = {
    Name = var.lb_name
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.elb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  default_action {
    type = "forward"
    forward {
      target_group {
        arn = aws_lb_target_group.tg.arn
      }
      stickiness {
        enabled  = true
        duration = 28800
      }
    }
  }
}
