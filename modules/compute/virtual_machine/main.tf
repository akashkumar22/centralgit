
#Lookup OS_Image
data azurerm_image "image_name" {
  resource_group_name = var.OS_image_ResGP_name
  name = var.OS_image_name
}
output "image_id" {
  value = data.azurerm_image.image_name.id
}

resource "azurerm_virtual_machine" "VMserver" {
  location = var.ResGP_location
  name = var.VMserver_name
  network_interface_ids = var.nic_card
  resource_group_name = var.ResGP_name
  vm_size = var.vm_size

    tags = {
    Environment     = var.tag_env
    Application     = var.tag_app
    Project_Number  = var.tag_projNum
    CostCenter      = var.tag_CostCen
    BusinessUnit    = var.tag_BusUnit
  }


  storage_image_reference {
    id = data.azurerm_image.image_name.id
  }
  storage_os_disk {
    create_option = var.VMServer_CreateOption
    name = "${var.VMserver_name}-${var.os_disk_name}"
  }
  delete_os_disk_on_termination = true
  os_profile {
    computer_name = var.VMserver_name
    admin_username = var.VMServer_admin_username
    admin_password = var.VMServer_admin_password
  }
  os_profile_windows_config {
    provision_vm_agent = var.OS_Profile_WindowsConfig
  }
#Add server to availability set
  availability_set_id = var.vm_availabilty_set_id

  #Add data disk
  storage_data_disk {
    create_option = var.data_disk_Coption
    name = var.data_disk_name
    disk_size_gb = var.data_disk_size
    lun = 0
  }

}

#Join VMServer1 to domain

resource "azurerm_virtual_machine_extension" "domainjoin1" {
  name  = var.VM_Extension_DomainName
  virtual_machine_id = azurerm_virtual_machine.VMserver.id
  publisher = var.VM_Extension_Publisher
  type = var.VM_Extension_Type
  type_handler_version = var.VM_Extension_TypeHandler

  settings = <<SETTINGS
  {
    "Name": "MHE.mhc",
    "User": "mhe\\a-robert_howard",
    "Restart": "true",
    "Options": "3",
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File choco.ps1",
    "fileUris": ["https://github.mheducation.com/MHE-OCI/AzureCode/blob/main/choco.ps1"]
  }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
  {

    "Password": "${var.domain_password}"
  }
PROTECTED_SETTINGS

}


