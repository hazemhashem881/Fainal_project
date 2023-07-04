resource "aws_security_group" "Workernode_sg" {
  name        = "eks-sg"
  description = "Allow all inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "all from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.sg_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-sg"
  }
}