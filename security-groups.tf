
resource "aws_security_group" "rshiny_worker_security_group" {
  name_prefix = "rshiny_worker_groups_worker_management"
  vpc_id      = module.vpc.vpc_id
  tags = {
    role = "Public"
    project = "Data triangulation"
    ManangedBy = "Terraform"
  }   
}

resource "aws_security_group_rule" "rshiny_sg_outbound_rules" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rshiny_worker_security_group.id
}

resource "aws_security_group_rule" "public_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rshiny_worker_security_group.id
}

resource "aws_security_group_rule" "public_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rshiny_worker_security_group.id
}

resource "aws_security_group_rule" "public_in_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rshiny_worker_security_group.id
}



resource "aws_security_group_rule" "public_in_rshiny_server" {
  type              = "ingress"
  from_port         = 3838
  to_port           = 3838
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rshiny_worker_security_group.id
}


resource "aws_security_group_rule" "public_in_mysql" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rshiny_worker_security_group.id
}