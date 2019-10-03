resource "google_compute_subnetwork" "dev-subnet" {
  ip_cidr_range = var.gcp_ip_cidr_range
  name          = var.subnet_names["subnet1"]
  network       = google_compute_network.our_gcp_dev_vpc_one.name
}

resource "aws_subnet" "subnet1" {
  cidr_block        = cidrsubnet(aws_vpc.our_aws_dev_vpc_one.cidr_block, 3, 1)
  vpc_id            = aws_vpc.our_aws_dev_vpc_one.id
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "subnet2" {
  cidr_block        = cidrsubnet(aws_vpc.our_aws_dev_vpc_one.cidr_block, 2, 2)
  vpc_id            = aws_vpc.our_aws_dev_vpc_one.id
  availability_zone = "us-west-2b"
}

resource "aws_security_group" "subnetsecurity" {
  vpc_id = aws_vpc.our_aws_dev_vpc_one.id
  ingress {
    cidr_blocks = [
      aws_vpc.our_aws_dev_vpc_one.cidr_block
    ]
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
  }
}