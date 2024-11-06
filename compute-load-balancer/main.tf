terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source               = "../organization-and-modules/modules/networking"
  prefix               = var.prefix
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}

module "web_server_sg" {
  source      = "../organization-and-modules/modules/security"
  prefix      = "web-server"
  description = "Security group for web servers"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = var.ingress_rules

  egress_rules = var.egress_rules

  tags = var.tags

}

module "instance_1" {
  source            = "../organization-and-modules/modules/compute"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnets_ids[0]
  security_group_id = module.web_server_sg.security_group_id

  user_data = <<-EOF
              #!/bin/bash
              #Install Docker
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo usermod -aG docker $USER
              newgrp docker

              #Install git
              sudo yum install git -y

              #Run nginx
              docker run --name red-nginx -p 80:80 -d myselfcarvajal/red-nginx:1.0
              EOF

  server_name = {
    Name = "red-nginx"
  }
}

module "instance_2" {
  source            = "../organization-and-modules/modules/compute"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnets_ids[1]
  security_group_id = module.web_server_sg.security_group_id

  user_data = <<-EOF
              #!/bin/bash
              #Install Docker
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo usermod -aG docker $USER
              newgrp docker

              #Install git
              sudo yum install git -y

              #Run nginx
              docker run --name blue-nginx -p 80:80 -d myselfcarvajal/blue-nginx:1.0
              EOF

  server_name = {
    Name = "blue-nginx"
  }
}
