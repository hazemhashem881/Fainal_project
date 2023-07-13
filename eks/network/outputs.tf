output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "pub_subnet1_id" {
  value = aws_subnet.pub_subnet1.id
}
output "pub_subnet2_id" {
  value = aws_subnet.pub_subnet2.id
}
output "priv_subnet1_id" {
  value = aws_subnet.priv_subnet1.id
}
output "priv_subnet2_id" {
  value = aws_subnet.priv_subnet2.id
}
output "vpc_cidr" {

  value = aws_vpc.myvpc.cidr_block
}
