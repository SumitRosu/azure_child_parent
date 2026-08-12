rgs = {
  rg1 = {
    name     = "sumrg1"
    location = "centralus"
  }

  rg2 = {
    name     = "sumrg2"
    location = "centralus"
  }
}

sds = {
  sd1 = {
    name                = "storageprodsum009988"
    location            = "centralus"
    resource_group_name = "sumrg1"

  }
}

vnets = {
  vnet1 = {
    name                = "prod_vnet"
    resource_group_name = "sumrg1"
    location            = "centralus"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "frontend_subnet"
    resource_group_name  = "sumrg1"
    virtual_network_name = "prod_vnet"
    address_prefixes     = ["10.0.1.0/24"]

  }
  subnet2 = {
    name                 = "backend_subnet"
    resource_group_name  = "sumrg1"
    virtual_network_name = "prod_vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }

  subnet3 = {
    name                 = "databace_subnet"
    resource_group_name  = "sumrg1"
    virtual_network_name = "prod_vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }

  subnet4 = {
    name                 = "application_subnet"
    resource_group_name  = "sumrg1"
    virtual_network_name = "prod_vnet"
    address_prefixes     = ["10.0.4.0/24"]

  }

  subnet5 = {
    name                 = "AzureBastion_subnet"
    resource_group_name  = "sumrg1"
    virtual_network_name = "prod_vnet"
    address_prefixes     = ["10.0.5.0/24"]
  }

}

pips = {
  pip1 = {
    name                = "pip1"
    resource_group_name = "sumrg1"
    location            = "centralus"
  }

  pip2 = {
    name                = "pip2"
    resource_group_name = "sumrg1"
    location            = "centralus"
  }

  pip3 = {
    name                = "pip3"
    resource_group_name = "sumrg1"
    location            = "centralus"
  }
}

nics = {
  nic1 = {
    name                  = "nic1"
    resource_group_name   = "sumrg1"
    location              = "centralus"
    ip_configuration_name = "ipconfig1"
    subnet_name           = "frontend_subnet"
    virtual_network_name  = "prod_vnet"
  pip_name = "pip1" }

  nic2 = {
    name                  = "nic2"
    resource_group_name   = "sumrg1"
    location              = "centralus"
    ip_configuration_name = "ipconfig2"
    subnet_name           = "backend_subnet"
    virtual_network_name  = "prod_vnet"
  pip_name = "pip2" }
}

nsg = {
  nsg1 = {
    name                 = "nsg1"
    resource_group_name  = "sumrg1"
    location             = "centralus"
    subnet_name          = "frontend_subnet"
    virtual_network_name = "prod_vnet"
  }
  nsg2 = {
    name                = "nsg2"
    resource_group_name = "sumrg1"
    location            = "centralus"
    subnet_name         = "backend_subnet"
  virtual_network_name = "prod_vnet" }

  nsg3 = {
    name                = "nsg3"
    resource_group_name = "sumrg1"
    location            = "centralus"
    subnet_name         = "databace_subnet"
  virtual_network_name = "prod_vnet" }
}

vms = {
  vm1 = {
    name                = "linuxvm1"
    resource_group_name = "sumrg1"
    location            = "centralus"
    admin_username      = "adminuser"
    admin_password      = "adminuser@123"
    nic_name            = "nic1"
  }
  vm2 = {
    name                = "linuxvm2"
    resource_group_name = "sumrg1"
    location            = "centralus"
    admin_username      = "adminuser"
    admin_password      = "adminuser@123"
    nic_name            = "nic2"
  }

}