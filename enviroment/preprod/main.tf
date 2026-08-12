module "resource_group" {
  source = "../../module/azurerm_resource_group"
  rgs    = var.rgs

}

module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_vnet"
  vnets      = var.vnets

}

module "storage" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_storage_account"
  sds        = var.sds

}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../module/azurerm_subnet"
  subnets    = var.subnets

}

module "pip" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_pip"
  pips       = var.pips

}

module "nic" {
  depends_on = [module.resource_group, module.subnet]
  source     = "../../module/azurerm_nic"
  nics       = var.nics

}

module "nsg" {
  depends_on = [module.resource_group, module.subnet]
  source     = "../../module/azurerm_nsg"
  nsg        = var.nsg

}

module "vms" {
  depends_on = [module.nic]
  source     = "../../module/azurerm_virtual_machin"
  vms        = var.vms

}