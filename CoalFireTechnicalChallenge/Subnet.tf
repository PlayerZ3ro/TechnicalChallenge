resource "aws_subnet" "Subnet-01" {
  vpc_id = "${aws_vpc.VPC-TC.id}"
  cidr_block = "10.1.0.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = "Subnet-01"
  }
}

resource "aws_subnet" "Subnet-02" {
  vpc_id = "${aws_vpc.VPC-TC.id}"
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = "Subnet-02"
  }
}

resource "aws_subnet" "Subnet-03" {
  vpc_id = "${aws_vpc.VPC-TC.id}"
  cidr_block = "10.1.2.0/24"
  availability_zone = "us-east-2b"
  
  tags = {
    Name = "Subnet-03"
  }
}

resource "aws_subnet" "Subnet-04" {
  vpc_id = "${aws_vpc.VPC-TC.id}"
  cidr_block = "10.1.3.0/24"
  availability_zone = "us-east-2b"
  
  tags = {
    Name = "Subnet-04"
  }
}

resource "aws_instance" "Instance-TC" {
  ami           = "ami-0ba62214afa52bec7"
  instance_type = "t2.micro"
  subnet_id = "subnet-02"
  //volume_size = 20 -throwing invalid argument, unclear as to why. Based on reference docs it seems this is valid.
  
  tags = {
    Name = "Instance-TC"
  }
}

/*resource "aws_launch_template" "template" {
  name_prefix   = "template"
  image_id      = "ami-1a2b3c"
  instance_type = "t2.micro"

resource "aws_autoscaling_group" "ASG-TC" {
  max_size = 6
  min_size = 2
  vpc_zone_identifier  = [aws_subnet.subnet-04.id]
  //I was not able to find any commands for storage size.
  
  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }
}*/

resource "aws_security_group" "Security-Groups-TC" {
  vpc_id = aws_vpc.VPC-TC.id
  
  tags = {
    Name = "Security-Groups-TC"
  }
}
