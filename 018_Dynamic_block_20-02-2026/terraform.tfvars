resource_group_name = "test-rg"
location            = "central india"
vnet_name           = "test-vnet"

subnets = {
  subnet-A = {
    subnet_name      = "a-subnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet-B = {
    subnet_name      = "B-subnet"
    address_prefixes = ["10.0.2.0/26"]
  }
    subnet-C = {
    subnet_name      = "c-subnet"
    address_prefixes = ["10.0.3.0/29"]
  }
  subnet-D = {
    subnet_name      = "d-subnet"
    address_prefixes = ["10.0.4.0/26"]
  }
    subnet-E = {
    subnet_name      = "e-subnet"
    address_prefixes = ["10.0.5.0/26"]
  }
}
