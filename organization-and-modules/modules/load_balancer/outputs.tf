output "tg" {
  value       = aws_lb_target_group.tg
  description = "This is Target Group id."
}

output "elb" {
  value       = aws_lb.elb
  description = "This is load balancer ID."
}
