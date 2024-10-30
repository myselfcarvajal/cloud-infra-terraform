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