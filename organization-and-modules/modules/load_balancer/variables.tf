variable "vpc_id" {
  description = "ID of the VPC where the load balancer and target group will be created."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the load balancer will be deployed."
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID to associate with the load balancer."
  type        = string
}

variable "target_instance_ids" {
  description = "List of instance IDs to register with the target group."
  type        = list(string)
}

variable "lb_name" {
  description = "Name of the Load Balancer."
  type        = string
  default     = "elb"
}

variable "target_group_name" {
  description = "Name of the Target Group."
  type        = string
  default     = "tg"
}

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

variable "target_type" {
  description = "Type of target in the target group (e.g., instance, ip, lambda)."
  type        = string
  default     = "instance"
}
