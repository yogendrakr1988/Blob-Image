terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "mobile01phone" {
  name     = "mobilephonerg"
  location = "West Europe"
}

resource "azurerm_storage_account" "mobile333" {
  name                     = "mobilephonesg"
  resource_group_name      = azurerm_resource_group.mobile01phone.name
  location                 = azurerm_resource_group.mobile01phone.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "mobilecontainer09" {
  name                  = "mobilephonecontainer08"
  storage_account_id    = azurerm_storage_account.mobile333.id
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "mobilephoneblob" {
  name                   = "mobilephonestorageblob"
  storage_account_name   = azurerm_storage_account.mobile333.name
  storage_container_name = azurerm_storage_container.mobilecontainer09.name
  type                   = "Block"
  source                 = "C:\\Users\\ks\\Downloads\\Hello1\\Yogi01.png"
  content_type           = "image/png"
}
output "blob_url" {
  value = azurerm_storage_blob.mobilephoneblob.url
}
 