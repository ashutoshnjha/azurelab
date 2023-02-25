resource "azurerm_virtual_network" "anjLabNetwork" {
    name = var.vnetName
    address_space = ["10.0.0.0/16"]
    location = var.location
    resource_group_name = azurerm_resource_group.anjLabGroup.name
    tags = var.tags
}

resource "azurerm_subnet" "anjLabSubnet" {
    name = var.subnetName
    resource_group_name = azurerm_resource_group.anjLabGroup.name
    virtual_network_name = azurerm_virtual_network.anjLabNetwork.name
    address_prefixes     = ["10.0.2.0/24"]
}

# Add public IP to access

resource "azurerm_public_ip" "anjLabPubIP" {
  name                = var.pubIpName
  resource_group_name = azurerm_resource_group.anjLabGroup.name
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = var.tags
}

# Create netwowrk security group to allow or block traffic to VM

resource "azurerm_network_security_group" "anjLabNsg" {
  name                = var.nsgName
  location            = var.location
  resource_group_name = azurerm_resource_group.anjLabGroup.name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = var.tags
}

# Create a virtual network interface card

resource "azurerm_network_interface" "anjLabNic" {
  name                = var.nicName
  location            = var.location
  resource_group_name = azurerm_resource_group.anjLabGroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.anjLabSubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.anjLabPubIP.id
  }
  tags = var.tags
}

# NIC and Network Security group  Association

resource "azurerm_network_interface_security_group_association" "anjLabNicSecGroupAssociation" {
  network_interface_id      = azurerm_network_interface.anjLabNic.id
  network_security_group_id = azurerm_network_security_group.anjLabNsg.id
}

# Add storage account to store the dignostic logs

# This random_id resource is used to give a unique name to storage  account name
resource "random_id" "randomId" {
    keepers = {
        resource_group = azurerm_resource_group.anjLabGroup.name
    }
    byte_length = 8
}

resource "azurerm_storage_account" "anjLabStorage" {
  name                     = "anjLabStorageAc${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.anjLabGroup.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = var.tags
}


# Add a Linix virtual machine
# refer vm.tf