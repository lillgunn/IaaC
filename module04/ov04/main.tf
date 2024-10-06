# Dette er main fil for øving04 - 06.10.2024
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "efc1e7b1-5729-4eea-b33e-12cc6b1c0183"
  features {

  }
}

resource "azurerm_network_security_group" "nsg-oving04" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.rgname
  tags                = local.common_tags
}

resource "azurerm_resource_group" "oving04" {
  name     = var.rgname
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_storage_account" "oving04" {
  count                    = length(var.storage_account_names)
  name                     = var.storage_account_names[count.index]
  resource_group_name      = azurerm_resource_group.oving04.name
  location                 = azurerm_resource_group.oving04.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags

}
resource "azurerm_network_security_group" "oving04" {
  name                = "oving04-security-group"
  location            = azurerm_resource_group.oving04.location
  resource_group_name = azurerm_resource_group.oving04.name
  tags                = local.common_tags
}

resource "azurerm_virtual_network" "vnet1oving04" {
  name                = var.network1
  location            = azurerm_resource_group.oving04.location
  resource_group_name = azurerm_resource_group.oving04.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  tags                = local.common_tags

   subnet {
    name             = var.subnet1
    address_prefixes = var.address_prefixes1
  }

}


resource "azurerm_virtual_network" "vnet2oving04" {
  name                = var.network2
  location            = azurerm_resource_group.oving04.location
  resource_group_name = azurerm_resource_group.oving04.name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  tags                = local.common_tags

   subnet {
    name             = var.subnet1
    address_prefixes = var.address_prefixes1
  }

}
