aksClusterName      = "anjlab-aks-cluster"
dnsPrefix           = "anjlab-aks-dns"
linuxProfileUser    = "superaj"
location            = "UK South"
nicName             = "anjlab-nic"
nsgName             = "anjlab-nsg"
pubIpName           = "anjlab-pubIp"
resourceGroupName   = "DevOpsAccelerator"
storageContainer    = "anjlab-stgcontainer"
storageName         = "anjlabstorage2023"
subnetName          =  "anjlab-subnet"
tags                = {
  Environment ="DEV",
  POC         = "ISTIO"
}
vmName              = "anjlab-vm1"
vnetName            = "anjlab-vmnet"
