data "aws_vpc" "vpc" {
  id = "${aws_vpc.vpc.id}"
}
data "aws_subnet" "subnet" {
  id = "${aws_subnet.subnet.id}"
}