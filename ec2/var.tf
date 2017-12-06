
variable "AMI"{
	default = "ami-e689729e"
}
variable "SG_IDs"{
	default = ["sg-afb5cfd2"]
}
variable "remote_state_bucket"{
	default = "jenkinstejas"
}
variable "vpc_state_file_name"{
	default = "vpc_state_file_name"
}
variable "aws_region"{
	default = "us-west-2"
}
