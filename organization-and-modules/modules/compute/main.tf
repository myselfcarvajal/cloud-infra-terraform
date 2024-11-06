resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  # security_group_ids = [var.security_group_id]
  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = true

  user_data = var.user_data

  tags = {
    Name = var.server_name["Name"]
  }
}
