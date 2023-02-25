# Add a Linix VM
# Reference https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "anjLabVM" {
  name                = var.vmName
  resource_group_name = azurerm_resource_group.anjLabGroup.name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "superaj"
  network_interface_ids = [
    azurerm_network_interface.anjLabNic.id,
  ]

  admin_ssh_key {
    username   = "superaj"
    public_key = tls_private_key.ssh-key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

# For Centos
  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_5"
    version   = "latest"
  }
# For Ubuntu
# To know available version
# az vm image list --location 'westeurope' --publisher 'canonical' --offer '0001-com-ubuntu-server-jammy' --sku '22_04-lts' --query '[].sku' --all --output tsv
#  source_image_reference {
#    publisher = "Canonical"
#    offer     = "UbuntuServer"
#    sku       = "22_04-lts"
#    version   = "latest"
#  }

  computer_name = var.vmName
  disable_password_authentication = true
}