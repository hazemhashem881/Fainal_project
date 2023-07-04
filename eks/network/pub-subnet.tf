resource "aws_subnet" "pub_subnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pub_subnet1
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 1"
  }
}
resource "aws_subnet" "pub_subnet2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pub_subnet2
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 2"
  }
}