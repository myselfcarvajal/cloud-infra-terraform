variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0ddc798b3f1a5117e"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID de la subred donde se desplegará la instancia"
  type        = string
}

variable "security_group_id" {
  description = "ID de la subred donde se desplegará la instancia"
  type        = string
}

variable "server_name" {
  description = "Tags for the instance"
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