# aws_lb_target_group
variable "target_group_name" {
  description = "Name of the Target Group."
  type        = string
  default     = "tg"
}

variable "target_group_port" {
  description = "Port on which the target group will forward requests."
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocol for the target group."
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "ID of the VPC where the load balancer and target group will be created."
  type        = string
}

variable "target_type" {
  description = "Type of target in the target group (e.g., instance, ip, lambda)."
  type        = string
  default     = "instance"
}

variable "health_check_path" {
  description = "Path for health check"
  type        = string
  default     = "/"
}

variable "health_check_protocol" {
  description = "Protocol for health check"
  type        = string
  default     = "HTTP"
}

variable "health_check_matcher" {
  description = "HTTP status code matcher for health check"
  type        = string
  default     = "200"
}

variable "health_check_interval" {
  description = "Interval for health check in seconds"
  type        = number
  default     = 15
}

variable "health_check_timeout" {
  description = "Timeout for health check in seconds"
  type        = number
  default     = 3
}

variable "healthy_threshold" {
  description = "Number of consecutive successful health checks before considering the target healthy"
  type        = number
  default     = 2
}

variable "unhealthy_threshold" {
  description = "Number of consecutive failed health checks before considering the target unhealthy"
  type        = number
  default     = 2
}

# aws_lb_target_group_attachment
variable "target_instance_ids" {
  description = "List of instance IDs to register with the target group."
  type        = list(string)
}

# aws_lb
variable "lb_name" {
  description = "Name of the Load Balancer."
  type        = string
  default     = "elb"
}

variable "subnet_ids" {
  description = "List of subnet IDs where the load balancer will be deployed."
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID to associate with the load balancer."
  type        = string
}

# aws_lb_listener
variable "listener_port" {
  description = "Port on which the load balancer will listen."
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Protocol for the load balancer listener."
  type        = string
  default     = "HTTP"
}

variable "stickiness_enabled" {
  description = "Whether stickiness is enabled for the target group"
  type        = bool
  default     = true
}

variable "stickiness_duration" {
  description = "Duration for stickiness in seconds"
  type        = number
  default     = 28800 # 8 hours for default
}
