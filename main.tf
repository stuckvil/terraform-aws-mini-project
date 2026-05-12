resource "aws_security_group" "web_sg" {
  name = "terraform-mini-project-sg"

  ingress { 
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami                    = "ami-0cf0e376c672104d6"
  instance_type          = var.instance_type
  key_name               = "Small Devops Project"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = file("user-data.sh")

  tags = {
    Name = "Terraform-Mini-Project"
  }
}

resource "aws_s3_bucket" "project_bucket" {
  bucket = "revpa-terraform-demo-bucket-2026-new"

  tags = {
    Name = "TerraformBucket"
  }
}

resource "aws_iam_user" "devops_user" {
  name = "terraform-devops-user"
}
