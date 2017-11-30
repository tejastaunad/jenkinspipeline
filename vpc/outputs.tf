output "vpc_id"{
  value = "${aws_vpc.Tejas_vpc.id}"
}
output "allocation_id"{
  value = "${aws_eip.Tejas_lb.id}"
}
output "Pubsubnet_id"{
  value = "${aws_subnet.pubSubnet1.id}"
}
output "nat_gateway_id"{
  value = "${aws_nat_gateway.Tejas_natgw.id}"
}
output "public_route_table_id"{
  value = "${aws_route_table.Tejas_pubroute_table.id}"
}
output "priv_route_table_id"{
  value = "${aws_route_table.Tejas_privroute_table.id}"
}
output "Privsubnet_id"{
  value = ["${aws_subnet.privSubnet1.id}","${aws_subnet.privSubnet2.id}","${aws_subnet.privSubnet3.id}","${aws_subnet.privSubnet4.id}"]
}
output "SecurityGroup_id"{
  value = "${aws_security_group.Tejas_SG.id}"
}

