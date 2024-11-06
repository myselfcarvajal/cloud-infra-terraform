# vpc module variables

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

# security groups module variables
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
