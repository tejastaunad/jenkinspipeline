variable "aws_region" {
    default = "us-west-2"
}
variable "cidr_block_vpc"{
	default = "10.0.0.0/16"
}
variable "cidr_block_SNpub1"{
	default = "10.0.1.0/24"
}
variable "cidr_block_SNpriv1"{
	default = "10.0.2.0/24"
}
variable "cidr_block_SNpriv2"{
	default = "10.0.3.0/24"
}
variable "cidr_block_SNpriv3"{
	default = "10.0.4.0/24"
}
variable "cidr_block_SNpriv4"{
	default = "10.0.5.0/24"
}

variable "cidr_block_to_internet"{
	default = "0.0.0.0/0"
}
variable "myip"{
	default = "202.65.158.154/32"
}
variable "jenkinsip"{
	default = "35.165.105.124/32"
}
