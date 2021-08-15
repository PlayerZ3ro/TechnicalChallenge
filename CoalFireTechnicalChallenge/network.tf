resource "aws_internet_gateway" "Internet-Gateway-TC" {
    vpc_id = "${aws_vpc.VPC-TC.id}"
    
	tags = {
        Name = "Internet-Gateway-TC"
    }
}

resource "aws_route_table" "Router-Table-TC" {
    vpc_id = "${aws_vpc.VPC-TC.id}"
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_internet_gateway.Internet-Gateway-TC.id}" 
    }
    
    tags = {
        Name = "Router-Table-TC"
    }
}

resource "aws_route_table_association" "Association1" {
  subnet_id = "${aws_subnet.Subnet-01.id}"
  route_table_id = "${aws_route_table.Router-Table-TC.id}"
}

resource "aws_route_table_association" "Association2" {
  subnet_id = "${aws_subnet.Subnet-02.id}"
  route_table_id = "${aws_route_table.Router-Table-TC.id}"
}

/*resource "aws_lb" "ALB-TC" {
  name               = "ALB-TC"
  internal           = false
  load_balancer_type = "network"
  subnets            = aws_subnet.Subnet-04.id

  enable_deletion_protection = true

  tags = {
    Environment = "test"
  }
}*/