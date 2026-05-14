resource "aws_security_group" "node_sg" {
  name = "nodejs-devops-sg"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
  from_port     = 22
  to_port       = 22
  protocol      = "tcp"
  cidr_blocks   = ["0.0.0.0/0"]
}

egress {
  from_port     = 0
  to_port       = 0
  protocol      = "tcp"
  cidr_blocks   = ["0.0.0.0/0"]
 }
}

resource "aws_instance" "node_server" {
  ami                    = "ami-05fb0b8c1424f266b"
  instance_type          = var.instance_type
  key_name               = "Small Devops Project"
  vpc_security_group_ids = [aws_security_group.node_sg.id]

  user_data = file("user-data.sh")

  tags = {
    Name = "Nodejs-Devops-project"
  }
}

resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/nodejs/devops/project"
  retention_in_days = 7
}

