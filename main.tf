# Creating resource group for the resources.
resource "azurerm_resource_group" "trainingRG" {
  name     = "${var.RGname}"
  location = "${var.location}"

  # Tagging for easier search.
  tags {
    environment = "trainingENV"
  }
}

resource "azurerm_virtual_network" "trainingNetwork" {
  name                = "${azurerm_resource_group.trainingRG.name}-trainingNetwork"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.trainingRG.location}"
  resource_group_name = "${azurerm_resource_group.trainingRG.name}"

  subnet {
    name           = "${azurerm_resource_group.trainingRG.name}-trainingSubnet"
    address_prefix = "10.0.1.0/24"
  }

  # Tagging for easier search.
  tags {
    environment = "trainingENV"
  }
}
