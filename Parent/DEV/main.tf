module "azurerm_resource_group" {
  source = "../../Child/azurerm_resource_group"
  RGs = var.RGs
}

module "azurerm_virtual_network" {
  source = "../../Child/azurerm_virtual_network"
  vnet = var.vnet
  depends_on = [ module.azurerm_resource_group ]
}

module "azurerm_subnet" {
  source = "../../Child/azurerm_subnet"
  subnets = var.subnets
  depends_on = [ module.azurerm_virtual_network ]
}

module "azurerm_public_ip" {
  source = "../../Child/azurerm_public_ip"
  public_ip = var.public_ip
  depends_on = [ module.azurerm_resource_group ]
}