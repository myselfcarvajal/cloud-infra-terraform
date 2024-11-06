variable "prefix" {
  description = "Prefix for resources"
  type        = string
  default     = "dev"
}

variable "description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group for web servers"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
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
  default = [
    {
      description     = "Allow HTTP traffic from anywhere"
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
    },
    {
      description     = "Allow HTTPS traffic from anywhere"
      from_port       = 443
      to_port         = 443
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
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
  default = [
    {
      description     = "Allow all outbound traffic"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
}

variable "tags" {
  description = "Tags for the security group"
  type        = map(string)
  default = {
    "Environment" = "dev"
    "Name"        = "web-server-sg"
  }
}
