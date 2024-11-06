output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnets_ids
}

output "private_subnets_ids" {
  description = "The IDs of the private subnets"
  value       = module.vpc.private_subnets_ids
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = module.vpc.public_route_table_id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = module.vpc.private_route_table_id
}

output "security_group_id" {
  value = module.web_server_sg.security_group_id
}

# EC2 instances
# Output para instance_1
output "instance_1_id" {
  description = "ID de la instancia EC2 para instance_1"
  value       = module.instance_1.instance_id
}

output "instance_1_public_ip" {
  description = "Dirección IP pública de la instancia EC2 para instance_1"
  value       = module.instance_1.public_ip
}

# Output para instance_2
output "instance_2_id" {
  description = "ID de la instancia EC2 para instance_2"
  value       = module.instance_2.instance_id
}

output "instance_2_public_ip" {
  description = "Dirección IP pública de la instancia EC2 para instance_2"
  value       = module.instance_2.public_ip
}
