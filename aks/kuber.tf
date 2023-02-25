resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aksClusterName
  location            = var.location
  resource_group_name = var.resourceGroupName
  dns_prefix          = var.dnsPrefix

  linux_profile {
    admin_username = var.linuxProfileUser
    ssh_key {
      key_data = var.ssh_key
    }
  }
    default_node_pool {
      name       = "anjnodepool"
      node_count = 2
      vm_size    = "Standard_A2_v2"
      type       = "VirtualMachineScaleSets"
    }

  service_principal {
    client_id     = "***"
    client_secret = "****"
  }

  tags = var.tags

}

/*
# To add the new node pool
resource "azurerm_kubernetes_cluster_node_pool" "mem" {
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  name                  = "mem"
  node_count            = "1"
  vm_size               = "standard_d11_v2"
}
*/