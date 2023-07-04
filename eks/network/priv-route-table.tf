resource "aws_route_table" "priv_route" {
  vpc_id = aws_vpc.myvpc.id

  route = []

  tags = {
    Name = "priv_route"
  }
}

## aws_route_table_association with subnet ##

resource "aws_route_table_association" "asso_priv_subnet1" {
  subnet_id      = aws_subnet.priv_subnet1.id
  route_table_id = aws_route_table.priv_route.id
}
resource "aws_route_table_association" "asso_priv_subnet2" {
  subnet_id      = aws_subnet.priv_subnet2.id
  route_table_id = aws_route_table.priv_route.id
}