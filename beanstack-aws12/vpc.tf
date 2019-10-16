resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_id}"
}
resource "aws_subnet" "subnet" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${var.subnet_id}"
  map_public_ip_on_launch = true
  
  tags = "${local.tags}" 
}
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"
}

# Route the public subnet traffic through the IGW
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.vpc.main_route_table_id}"
  destination_cidr_block = "${var.destination_cidr}"
  gateway_id             = "${aws_internet_gateway.gw.id}"
  
}