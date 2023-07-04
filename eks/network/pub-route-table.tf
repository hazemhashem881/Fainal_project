resource "aws_route_table" "pub_route" {
  vpc_id = aws_vpc.myvpc.id

  route = []

  tags = {
    Name = "pub_route"
  }
}

## Routing
resource "aws_route" "Routing" {
  route_table_id            = aws_route_table.pub_route.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

## aws_route_table_association with subnet ##

resource "aws_route_table_association" "asso_pub_subnet1" {
  subnet_id      = aws_subnet.pub_subnet1.id
  route_table_id = aws_route_table.pub_route.id
}


resource "aws_route_table_association" "asso_pub_subnet2" {
  subnet_id      = aws_subnet.pub_subnet2.id
  route_table_id = aws_route_table.pub_route.id
}
