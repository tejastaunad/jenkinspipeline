provider "aws" {
  region = "us-west-2"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
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
  security_groups = ["${data.terraform_remote_state.vpc.SecurityGroup_id}"]
  key_name = "Tejas_O"
  availability_zone = "us-west-2a"
  associate_public_ip_address = "true"
  user_data = "${file("script.sh")}"
  tags {
    Name = "Ec2"
    Owner = "Tejas"
    Project = "learning"
    Environment = "Testing"
    Expi_date = "2017-12-20"
  }
}
