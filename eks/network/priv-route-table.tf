resource "aws_route_table" "priv_route1" {
  vpc_id = aws_vpc.myvpc.id

  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat-1.id
  }

  tags = {
    Name = "priv_route1"
  }
}

# resource "aws_route_table" "priv_route2" {
#   vpc_id = aws_vpc.myvpc.id

#   route {
#         cidr_block = "0.0.0.0/0"
#         nat_gateway_id = aws_nat_gateway.nat-2.id
#   }

#   tags = {
#     Name = "priv_route2"
#   }
# }

## aws_route_table_association with subnet ##

resource "aws_route_table_association" "asso_priv_subnet1" {
  subnet_id      = aws_subnet.priv_subnet1.id
  route_table_id = aws_route_table.priv_route1.id
}
# resource "aws_route_table_association" "asso_priv_subnet2" {
#   subnet_id      = aws_subnet.priv_subnet2.id
#   route_table_id = aws_route_table.priv_route1.id
# }