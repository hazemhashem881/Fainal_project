resource "aws_nat_gateway" "nat-1" {
  allocation_id = aws_eip.eip-1.id
  subnet_id     = aws_subnet.pub_subnet1.id

  tags = {
    Name = "${var.ws_name}-nat-1"
  }
}

# resource "aws_nat_gateway" "nat-2" {
#   allocation_id = aws_eip.eip-2.id
#   subnet_id     = aws_subnet.pub_subnet2.id

#   tags = {
#     Name = "${var.ws_name}-nat-2"
#   }
# }