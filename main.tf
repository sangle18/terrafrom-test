# Configure the Microsoft Azure Provider.
provider "azurerm" {
  version = "~>2.77"
  subscription_id = "66d060d7-4e91-4728-8144-9c185b9ebeb4"
  client_id       = "f418fcd7-d8a5-4d74-b795-c6a9d5d31d48"
  client_secret   = "Vay7Q~gOpLFuqfHR1d4rPt45LuWS~SXYLNt20"
  tenant_id       = "93f33571-550f-43cf-b09f-cd331338d086"

  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "${var.name_resourcegroup}"
  location = "Southeast Asia"
  tags = "${var.tags}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "virtualNetwork01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = "${var.address}"
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet-vm"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = "${var.subnet01}"
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet-datqabase"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
