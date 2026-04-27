terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "4.58.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_managed_disk" "res-0" {
  create_option                     = "FromImage"
  disk_access_id                    = ""
  disk_encryption_set_id            = ""
  disk_iops_read_only               = 0
  disk_iops_read_write              = 120
  disk_mbps_read_only               = 0
  disk_mbps_read_write              = 25
  disk_size_gb                      = 30
  edge_zone                         = ""
  gallery_image_reference_id        = ""
  hyper_v_generation                = "V2"
  image_reference_id                = "/Subscriptions/f90d45a9-d36f-4177-b580-f5bebc0eb93a/Providers/Microsoft.Compute/Locations/westus2/Publishers/canonical/ArtifactTypes/VMImage/Offers/ubuntu-24_04-lts/Skus/server-arm64/Versions/24.04.202603120"
  location                          = "westus2"
  max_shares                        = 0
  name                              = "projet-pipeline-backend_OsDisk_1_fe8fceb7bfe84ccd946a17b7108f8edb"
  network_access_policy             = "AllowAll"
  on_demand_bursting_enabled        = false
  optimized_frequent_attach_enabled = false
  os_type                           = "Linux"
  performance_plus_enabled          = false
  public_network_access_enabled     = true
  resource_group_name               = "PROJET-PIPELINE"
  secure_vm_disk_encryption_set_id  = ""
  security_type                     = ""
  source_resource_id                = ""
  source_uri                        = ""
  storage_account_id                = ""
  storage_account_type              = "Premium_LRS"
  tags                              = {}
  tier                              = "P4"
  trusted_launch_enabled            = false
  upload_size_bytes                 = 0
  zone                              = "1"
}
resource "azurerm_ssh_public_key" "res-1" {
  location            = "westus2"
  name                = "projet-pipeline-backend_key"
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD0NH8qFi+jxJ719EawpxU86vXcmDc1suMI4YeTpGWVy6oUf+hgyhlA/cRzulQEDroL9Is5fzxJMgAUHmB+wBQ5r2NmepiSVOxPSH+++rXmyBxso4O+EybNabW4eVpuEBLLwLTx8A3RcES8hB6+ztaIs3z9tNn6jCvKbpFanu/2jsruP6WJOE61piwhaISJ0ktIa5Fct+V/ORxTkYibzJC3lTcIbPUEUt9dCg98d4nCRwVL6LS2jyJymdQniEmizeEIbJd++5oYN0UB7/K56fp+DarvahpwI2yYT/i8KwnnO7piyotmhuYEEBpp+8eR6aUnvhE5/DrHzfMrFHqYnMFb11jKKsRwBulY21wNSy+MZO2ZkQszgIaedI3ekD2vg1xTgVE6oXXh8yBO3k9C1rGp8q0Ke2Jj0Ai6Q/o3WqSPbRs9BmGVwxbruhQgFJ5TyoZbZyQnceHOwITSwa1P/31COsPJJZnUoXVxk0QShA9tE5UEDFAvLE3XszzOvvgF+Mk= generated-by-azure"
  resource_group_name = "projet-pipeline"
  tags                = {}
}
resource "azurerm_linux_virtual_machine" "res-2" {
  admin_password                                         = "" # Masked sensitive attribute
  admin_username                                         = "azureuser"
  allow_extension_operations                             = true
  availability_set_id                                    = ""
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  capacity_reservation_group_id                          = ""
  computer_name                                          = "projet-pipeline-backend"
  custom_data                                            = "" # Masked sensitive attribute
  dedicated_host_group_id                                = ""
  dedicated_host_id                                      = ""
  disable_password_authentication                        = true
  disk_controller_type                                   = "SCSI"
  edge_zone                                              = ""
  encryption_at_host_enabled                             = false
  eviction_policy                                        = ""
  extensions_time_budget                                 = "PT1H30M"
  license_type                                           = ""
  location                                               = "westus2"
  max_bid_price                                          = -1
  name                                                   = "projet-pipeline-backend"
  network_interface_ids                                  = [azurerm_network_interface.res-4.id]
  os_managed_disk_id                                     = azurerm_managed_disk.res-0.id
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "ImageDefault"
  platform_fault_domain                                  = -1
  priority                                               = "Regular"
  provision_vm_agent                                     = true
  proximity_placement_group_id                           = ""
  reboot_setting                                         = ""
  resource_group_name                                    = "projet-pipeline"
  secure_boot_enabled                                    = false
  size                                                   = "Standard_B2pts_v2"
  source_image_id                                        = ""
  tags                                                   = {}
  user_data                                              = ""
  virtual_machine_scale_set_id                           = ""
  vm_agent_platform_updates_enabled                      = false
  vtpm_enabled                                           = false
  zone                                                   = "1"
  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }
  admin_ssh_key {
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD0NH8qFi+jxJ719EawpxU86vXcmDc1suMI4YeTpGWVy6oUf+hgyhlA/cRzulQEDroL9Is5fzxJMgAUHmB+wBQ5r2NmepiSVOxPSH+++rXmyBxso4O+EybNabW4eVpuEBLLwLTx8A3RcES8hB6+ztaIs3z9tNn6jCvKbpFanu/2jsruP6WJOE61piwhaISJ0ktIa5Fct+V/ORxTkYibzJC3lTcIbPUEUt9dCg98d4nCRwVL6LS2jyJymdQniEmizeEIbJd++5oYN0UB7/K56fp+DarvahpwI2yYT/i8KwnnO7piyotmhuYEEBpp+8eR6aUnvhE5/DrHzfMrFHqYnMFb11jKKsRwBulY21wNSy+MZO2ZkQszgIaedI3ekD2vg1xTgVE6oXXh8yBO3k9C1rGp8q0Ke2Jj0Ai6Q/o3WqSPbRs9BmGVwxbruhQgFJ5TyoZbZyQnceHOwITSwa1P/31COsPJJZnUoXVxk0QShA9tE5UEDFAvLE3XszzOvvgF+Mk= generated-by-azure"
    username   = "azureuser"
  }
  boot_diagnostics {
    storage_account_uri = ""
  }
  os_disk {
    caching                          = "ReadWrite"
    disk_encryption_set_id           = ""
    disk_size_gb                     = 30
    name                             = "projet-pipeline-backend_OsDisk_1_fe8fceb7bfe84ccd946a17b7108f8edb"
    secure_vm_disk_encryption_set_id = ""
    security_encryption_type         = ""
    storage_account_type             = "Premium_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "ubuntu-24_04-lts"
    publisher = "canonical"
    sku       = "server-arm64"
    version   = "latest"
  }
}
resource "azurerm_linux_virtual_machine" "res-3" {
  admin_password                                         = "" # Masked sensitive attribute
  admin_username                                         = "azureuser"
  allow_extension_operations                             = true
  availability_set_id                                    = ""
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  capacity_reservation_group_id                          = ""
  computer_name                                          = "projet-pipeline-frontend"
  custom_data                                            = "" # Masked sensitive attribute
  dedicated_host_group_id                                = ""
  dedicated_host_id                                      = ""
  disable_password_authentication                        = true
  disk_controller_type                                   = "SCSI"
  edge_zone                                              = ""
  encryption_at_host_enabled                             = false
  eviction_policy                                        = ""
  extensions_time_budget                                 = "PT1H30M"
  license_type                                           = ""
  location                                               = "westus2"
  max_bid_price                                          = -1
  name                                                   = "projet-pipeline-frontend"
  network_interface_ids                                  = ["/subscriptions/f90d45a9-d36f-4177-b580-f5bebc0eb93a/resourceGroups/projet-pipeline/providers/Microsoft.Network/networkInterfaces/projet-pipeline-frontend491_z1"]
  os_managed_disk_id                                     = "/subscriptions/f90d45a9-d36f-4177-b580-f5bebc0eb93a/resourceGroups/PROJET-PIPELINE/providers/Microsoft.Compute/disks/projet-pipeline-frontend_OsDisk_1_f56f4ea092d64b36b1cd4643da10aaac"
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "ImageDefault"
  platform_fault_domain                                  = -1
  priority                                               = "Regular"
  provision_vm_agent                                     = true
  proximity_placement_group_id                           = ""
  reboot_setting                                         = ""
  resource_group_name                                    = "projet-pipeline"
  secure_boot_enabled                                    = false
  size                                                   = "Standard_B2pts_v2"
  source_image_id                                        = ""
  tags = {
    projet-pipeline-vm = "frontend"
  }
  user_data                         = ""
  virtual_machine_scale_set_id      = ""
  vm_agent_platform_updates_enabled = false
  vtpm_enabled                      = false
  zone                              = "1"
  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }
  admin_ssh_key {
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5woCqHMcTbb36oe0Csp7RuLGvyoM1j5N+rl2mCxe5PG3n1V049uukH+80vSDX7n2IMZA3DVa1pPCu4qIFyHkR7rioCywmMC124BNWuLDU8s/AlS3slwjqgll0RnkZ/b7+8cIQytv5K3YQzXObOTkzHMBA+9iwSeyG+YjJN47GTv7ggfDwJ5aS87/gexQb5UbHHsfyPvbc9IKDUAxvXhxoYNvbnp6palkKnDStVwGWQc3T1dYRR7zui7+bVl3cGR3aW86K9Wq8mGgcQc+ecKRN2i+GRd0Wtds4no39oAamdsEC8JR/osSRgFf3522GMprlNHVRymsoPY+3WBhhmueBb4oIsMXbXv5T914WbXdnOYMlu6mXtGtT3jALfnef7+08IkHegZh3E4qwybnkOI6kPp5qwLo6G0ohvKrh7RXS3JaI4AUBkEf12MMhPWJuJ2OMzE7CZZJsN7bsUd2rLyKB2qtZ3hWrDnA6NjTP4bw9rbaOK2YvBxHrFEBpsNZOiKU= generated-by-azure"
    username   = "azureuser"
  }
  boot_diagnostics {
    storage_account_uri = ""
  }
  os_disk {
    caching                          = "ReadWrite"
    disk_encryption_set_id           = ""
    disk_size_gb                     = 30
    name                             = "projet-pipeline-frontend_OsDisk_1_f56f4ea092d64b36b1cd4643da10aaac"
    secure_vm_disk_encryption_set_id = ""
    security_encryption_type         = ""
    storage_account_type             = "Premium_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "ubuntu-24_04-lts"
    publisher = "canonical"
    sku       = "server-arm64"
    version   = "latest"
  }
}
resource "azurerm_network_interface" "res-4" {
  accelerated_networking_enabled = true
  auxiliary_mode                 = ""
  auxiliary_sku                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  internal_dns_name_label        = ""
  ip_forwarding_enabled          = false
  location                       = "westus2"
  name                           = "projet-pipeline-backend614_z1"
  resource_group_name            = "projet-pipeline"
  tags                           = {}
  ip_configuration {
    gateway_load_balancer_frontend_ip_configuration_id = ""
    name                                               = "ipconfig1"
    primary                                            = true
    private_ip_address                                 = "10.0.0.5"
    private_ip_address_allocation                      = "Dynamic"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = azurerm_public_ip.res-7.id
    subnet_id                                          = "/subscriptions/f90d45a9-d36f-4177-b580-f5bebc0eb93a/resourceGroups/projet-pipeline/providers/Microsoft.Network/virtualNetworks/projet-pipeline-frontend-vnet/subnets/default"
  }
}
resource "azurerm_network_security_group" "res-5" {
  location            = "westus2"
  name                = "projet-pipeline-backend-nsg"
  resource_group_name = "projet-pipeline"
  security_rule = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "22"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "SSH"
    priority                                   = 300
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "3000"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "HTTP"
    priority                                   = 320
    protocol                                   = "Tcp"
    source_address_prefix                      = "20.64.168.21"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "443"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "HTTPS"
    priority                                   = 340
    protocol                                   = "Tcp"
    source_address_prefix                      = "20.64.168.21"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
  tags = {}
}
resource "azurerm_network_security_group" "res-6" {
  location            = "westus2"
  name                = "projet-pipeline-frontend-nsg"
  resource_group_name = "projet-pipeline"
  security_rule = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "22"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "SSH"
    priority                                   = 300
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "443"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "HTTPS"
    priority                                   = 320
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "80"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "HTTP"
    priority                                   = 340
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
  tags = {
    projet-pipeline-vm = "frontend"
  }
}
resource "azurerm_public_ip" "res-7" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  edge_zone               = ""
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "westus2"
  name                    = "projet-pipeline-backend-ip"
  resource_group_name     = "projet-pipeline"
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
  zones                   = ["1"]
}
resource "azurerm_public_ip" "res-8" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  edge_zone               = ""
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "westus2"
  name                    = "projet-pipeline-frontend-ip"
  resource_group_name     = "projet-pipeline"
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags = {
    projet-pipeline-vm = "frontend"
  }
  zones = ["1"]
}
resource "azurerm_mssql_server" "res-9" {
  administrator_login                          = "spokay"
  administrator_login_password                 = "" # Masked sensitive attribute
  administrator_login_password_wo              = "" # Masked sensitive attribute
  administrator_login_password_wo_version      = 0
  connection_policy                            = "Default"
  express_vulnerability_assessment_enabled     = false
  location                                     = "westus2"
  minimum_tls_version                          = "1.2"
  name                                         = "projet-pipeline"
  outbound_network_restriction_enabled         = false
  primary_user_assigned_identity_id            = ""
  public_network_access_enabled                = true
  resource_group_name                          = "projet-pipeline"
  tags                                         = {}
  transparent_data_encryption_key_vault_key_id = ""
  version                                      = "12.0"
  azuread_administrator {
    azuread_authentication_only = false
    login_username              = "hugo.bressange@efrei.net"
    object_id                   = "de57763c-b091-456d-84dc-a9b9a4512756"
    tenant_id                   = "413600cf-bd4e-4c7c-8a61-69e73cddf731"
  }
}
resource "azurerm_mssql_database" "res-10" {
  auto_pause_delay_in_minutes                                = 60
  collation                                                  = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                                                = "Default"
  elastic_pool_id                                            = ""
  enclave_type                                               = ""
  geo_backup_enabled                                         = true
  ledger_enabled                                             = false
  license_type                                               = ""
  maintenance_configuration_name                             = "SQL_Default"
  max_size_gb                                                = 32
  min_capacity                                               = 0.5
  name                                                       = "projet-pipeline"
  read_replica_count                                         = 0
  read_scale                                                 = false
  secondary_type                                             = ""
  server_id                                                  = azurerm_mssql_server.res-9.id
  sku_name                                                   = "GP_S_Gen5_2"
  storage_account_type                                       = "Local"
  tags                                                       = {}
  transparent_data_encryption_enabled                        = true
  transparent_data_encryption_key_automatic_rotation_enabled = false
  transparent_data_encryption_key_vault_key_id               = ""
  zone_redundant                                             = false
  long_term_retention_policy {
    immutable_backups_enabled = false
    monthly_retention         = "PT0S"
    week_of_year              = 1
    weekly_retention          = "PT0S"
    yearly_retention          = "PT0S"
  }
  short_term_retention_policy {
    backup_interval_in_hours = 12
    retention_days           = 7
  }
  threat_detection_policy {
    disabled_alerts            = []
    email_account_admins       = "Disabled"
    email_addresses            = []
    retention_days             = 0
    state                      = "Disabled"
    storage_account_access_key = "" # Masked sensitive attribute
    storage_endpoint           = ""
  }
}
resource "azurerm_network_interface_security_group_association" "res-11" {
  network_interface_id      = azurerm_network_interface.res-4.id
  network_security_group_id = azurerm_network_security_group.res-5.id
}
