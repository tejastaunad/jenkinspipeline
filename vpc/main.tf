provider "aws" {

  region = "${var.aws_region}"
 }
resource "terraform_remote_state" "vpc" {

  backend = "s3"

  config {

    bucket = "${var.remote_state_bucket}"

    key = "${var.vpc_state_file_name}"

    region = "${var.aws_region}"

  }

}

resource "aws_vpc" "Tejas_vpc" {
  cidr_block       = "${var.cidr_block_vpc}"
  instance_tenancy = "default"

  tags {
    Name = "VPC"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"

  }
}

resource "aws_internet_gateway" "Tejas_igw" {
  vpc_id = "${aws_vpc.Tejas_vpc.id}"

  tags {
    Name = "IGW"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"

  }
}
resource "aws_nat_gateway" "Tejas_natgw" {
  allocation_id = "${aws_eip.Tejas_lb.id}"
  subnet_id     = "${aws_subnet.pubSubnet1.id}"

}
resource "aws_eip" "Tejas_lb" {
  vpc      = true
}

resource "aws_subnet" "pubSubnet1" {
  vpc_id     = "${aws_vpc.Tejas_vpc.id}"
  cidr_block = "${var.cidr_block_SNpub1}"

  tags {
    Name = "pubSubnet1"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"

  }
}
resource "aws_subnet" "privSubnet1" {
  vpc_id     = "${aws_vpc.Tejas_vpc.id}"
  cidr_block = "${var.cidr_block_SNpriv1}"

  tags {
    Name = "privSubnet1"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"

  }
}
resource "aws_subnet" "privSubnet2" {
  vpc_id     = "${aws_vpc.Tejas_vpc.id}"
  cidr_block = "${var.cidr_block_SNpriv2}"

  tags {
    Name = "privSubnet2"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"

  }
}
resource "aws_subnet" "privSubnet3" {
  vpc_id     = "${aws_vpc.Tejas_vpc.id}"
  cidr_block = "${var.cidr_block_SNpriv3}"

  tags {
    Name = "privSubnet3"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"

  }
}
resource "aws_subnet" "privSubnet4" {
  vpc_id     = "${aws_vpc.Tejas_vpc.id}"
  cidr_block = "${var.cidr_block_SNpriv4}"

  tags {
    Name = "privSubnet4"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"

  }
}
resource "aws_route_table" "Tejas_pubroute_table" {
  vpc_id = "${aws_vpc.Tejas_vpc.id}"

  route {
    cidr_block = "${var.cidr_block_to_internet}"
    gateway_id = "${aws_internet_gateway.Tejas_igw.id}"
  }

  tags {
    Name = "route_table"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"

  }
}
resource "aws_route_table" "Tejas_privroute_table" {
  vpc_id = "${aws_vpc.Tejas_vpc.id}"

  route {
    cidr_block = "${var.cidr_block_to_internet}"
    nat_gateway_id = "${aws_nat_gateway.Tejas_natgw.id}"
  }

  tags {
    Name = "route_table"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"

  }
}
resource "aws_route_table_association" "public_route_table_association1" {
  subnet_id      = "${aws_subnet.pubSubnet1.id}"
  route_table_id = "${aws_route_table.Tejas_pubroute_table.id}"
}
resource "aws_route_table_association" "private_route_table_association1" {
  subnet_id      = "${aws_subnet.privSubnet1.id}"
  route_table_id = "${aws_route_table.Tejas_privroute_table.id}"
}
resource "aws_route_table_association" "private_route_table_association2" {
  subnet_id      = "${aws_subnet.privSubnet2.id}"
  route_table_id = "${aws_route_table.Tejas_privroute_table.id}"
}
resource "aws_route_table_association" "private_route_table_association3" {
  subnet_id      = "${aws_subnet.privSubnet3.id}"
  route_table_id = "${aws_route_table.Tejas_privroute_table.id}"
}
resource "aws_route_table_association" "private_route_table_association4" {
  subnet_id      = "${aws_subnet.privSubnet4.id}"
  route_table_id = "${aws_route_table.Tejas_privroute_table.id}"
}
resource "aws_network_acl" "Tejas_nacl" {
  vpc_id = "${aws_vpc.Tejas_vpc.id}"
  subnet_ids = ["${aws_subnet.pubSubnet1.id}","${aws_subnet.privSubnet1.id}","${aws_subnet.privSubnet2.id}","${aws_subnet.privSubnet3.id}","${aws_subnet.privSubnet4.id}"]

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${var.cidr_block_to_internet}"
    from_port  = 0
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.cidr_block_to_internet}"
    from_port  = 0
    to_port    = 65535
  }

  tags {
    Name = "route_table"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"

  }
}
resource "aws_security_group" "Tejas_SG" {
  name        = "Tejas_SG"
  vpc_id      = "${aws_vpc.Tejas_vpc.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.myip}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
    tags {
    Name = "route_table"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"

  }
}
