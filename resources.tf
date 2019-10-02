resource "google_compute_network" "our_gcp_dev_vpc_one" {
  name = "terraform-gcp-vpc-one"
  auto_create_subnetworks = true
}

resource "aws_vpc" "our_aws_dev_vpc_one" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "terraform-aws-vpc-one"
    }
}