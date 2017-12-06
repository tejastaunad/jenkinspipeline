provider "aws" {
  region = "us-west-2"
 }
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    bucket = "${var.remote_state_bucket}"
    key = "${var.vpc_state_file_name}"
    region = "${var.aws_region}"
  }
}
resource "aws_instance" "Tejas_EC2" {
  ami           = "${var.AMI}"
  instance_type = "t2.micro"
  subnet_id = "${data.terraform_remote_state.vpc.Pubsubnet_id}"
  security_groups = "${var.SG_IDs}"
  key_name = "Tejas_keypair"
  availability_zone = "us-west-2a"
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
