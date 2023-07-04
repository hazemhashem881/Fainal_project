resource "aws_subnet" "priv_subnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.priv_subnet1

  tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_subnet" "priv_subnet2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.priv_subnet2

  tags = {
    Name = "Private Subnet 2"
  }
}