provider "aws" {
  region = "us-west-2"
 }

resource "aws_instance" "Tejas_EC2" {
  ami           = "${var.AMI}"
  instance_type = "t2.micro"
  subnet_id = "subnet-4051df08"
  vpc_security_group_ids = "${var.SG_IDs}"
  key_name = "Tejas_keypair"
  availability_zone = "us-west-2b"
  associate_public_ip_address = "true"
  user_data = "${file("script.sh")}"
  tags {
    Name = "Ec2"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"
    Expi_date = "2017-11-10"
  }
}