# Create a storage account within the resource group
resource "azurerm_storage_account" "sa" {
  name                     = var.storageaccountname
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

# Create public ip
resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"

  tags = var.tags
}

# Create a Network security group
resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags
}

# Associate NSG to Subnet
resource "azurerm_subnet_network_security_group_association" "snet_nsg_assoc" {
  depends_on = [azurerm_network_security_group.nsg,
  data.azurerm_subnet.snet]
  subnet_id                 = data.azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create a NIC
resource "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }

  tags = var.tags
}

# Create a windows virtual machine
resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.virtual_machine_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  size                = var.virtual_machine_size
  admin_username      = var.admin_username
  admin_password      = data.azurerm_key_vault_secret.example.value
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    name                 = "${var.virtual_machine_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}