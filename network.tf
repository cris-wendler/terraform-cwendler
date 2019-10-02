resource "google_compute_network" "our_gcp_dev_vpc_one" {
  name                    = "terraform-gcp-vpc-one"
  auto_create_subnetworks = false
}

resource "aws_vpc" "our_aws_dev_vpc_one" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "terraform-aws-vpc-one"
  }
}

resource "azurerm_resource_group" "azy_network" {
  location = "West US"
  name     = "devresourcegrp"
}

resource "azurerm_virtual_network" "blue_virtual_network" {
  address_space       = ["10.0.0.0/16"]
  location            = "West US"
  name                = "bluevirtnetwork"
  resource_group_name = azurerm_resource_group.azy_network.name
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    address_prefix = "10.0.1.0/24"
    name           = "subnet1"
  }

  subnet {
    address_prefix = "10.0.2.0/24"
    name           = "subnet2"
  }

  tags = {
    environment = "blue-world-finder"
  }
}