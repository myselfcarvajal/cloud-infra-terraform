# vpc
variable "prefix" {
  description = "Prefix resources"
  default     = "dev"
  type        = string
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  default     = "10.11.0.0/16"
  type        = string
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.11.11.0/24", "10.11.12.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.11.61.0/24", "10.11.62.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}

# security groups
variable "description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group for web servers"
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    description     = string
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string), [])
    security_groups = optional(list(string), [])
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    description     = string
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string), [])
    security_groups = optional(list(string), [])
  }))
  default = []
}

variable "tags" {
  description = "Tags for the security group"
  type        = map(string)
  default     = {}
}

# compute
variable "ami_id" {
  description = "AMI ID para la instancia EC2"
  type        = string
  default     = "ami-12345678"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "server_name" {
  description = "Tags for the security group"
  type        = map(string)
  default = {
    "Name" = "web-server"
  }
}

variable "user_data" {
  description = "Configuration script to be run at EC2 instance startup"
  type        = string
  default     = ""
}

# load balancer
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

# aws_lb
variable "lb_name" {
  description = "Name of the Load Balancer."
  type        = string
  default     = "elb"
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
