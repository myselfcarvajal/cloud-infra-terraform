resource "aws_security_group" "sg" {
  name        = "${var.prefix}-security-group"
  description = var.description
  vpc_id      = var.vpc_id

  # Inbound rules (ingress)
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description     = lookup(ingress.value, "description", "")
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = lookup(ingress.value, "cidr_blocks", [])
      security_groups = lookup(ingress.value, "security_groups", [])
    }
  }

  # Outbound rules (egress)
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description     = lookup(egress.value, "description", "")
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      cidr_blocks     = lookup(egress.value, "cidr_blocks", [])
      security_groups = lookup(egress.value, "security_groups", [])
    }
  }

  tags = var.tags
}
