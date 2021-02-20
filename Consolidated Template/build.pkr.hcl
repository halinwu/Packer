source "vsphere-iso" "centos-7" {
  CPUs            = var.CPUs
  RAM             = var.RAM
  RAM_reserve_all = var.ram_reserve_all
  boot_command    = var.boot_command
  boot_order      = var.boot_order
  boot_wait       = var.boot_wait
  cluster         = var.vsphere_compute_cluster
  content_library_destination {
    destroy = var.library_vm_destroy
    library = var.content_library_destination
    name    = var.template_library_Name
    ovf     = var.ovf
  }
  datacenter           = var.vsphere_datacenter
  datastore            = var.vsphere_datastore
  disk_controller_type = var.disk_controller_type
  firmware             = var.firmware
  //remove and use http or install oscdimg
  floppy_files         = var.config_files
  folder               = var.vsphere_folder
  guest_os_type        = var.guest_os_type
  insecure_connection  = var.insecure_connection
  iso_paths            = [var.os_iso_path,var.vmtools_iso_path]
  ip_wait_timeout      = var.ip_wait_timeout
  network_adapters {
    network      = var.vsphere_portgroup_name
    network_card = var.network_card
  }
  notes        = var.notes
  password     = var.vsphere_password
  communicator = var.communicator
  ssh_password = var.ssh_password
  ssh_timeout  = var.ssh_timeout
  ssh_username = var.ssh_username
  storage {
    disk_size             = var.disk_size
    disk_thin_provisioned = var.disk_thin_provisioned
  }
  username       = var.vsphere_user
  vcenter_server = var.vsphere_server
  vm_name        = var.vm_name
  vm_version     = var.vm_version
}
source "vsphere-iso" "win-2019-std-core" {
  CPUs            = var.CPUs
  RAM             = var.RAM
  RAM_reserve_all = var.ram_reserve_all
  boot_command    = var.boot_command
  boot_order      = var.boot_order
  boot_wait       = var.boot_wait
  cluster         = var.vsphere_compute_cluster
  content_library_destination {
    destroy = var.library_vm_destroy
    library = var.content_library_destination
    name    = var.template_library_Name
    ovf     = var.ovf
  }
  datacenter           = var.vsphere_datacenter
  datastore            = var.vsphere_datastore
  disk_controller_type = var.disk_controller_type
  firmware             = var.firmware
  //remove and use http or install oscdimg
  floppy_files         = var.config_files
  folder               = var.vsphere_folder
  guest_os_type        = var.guest_os_type
  insecure_connection  = var.insecure_connection
  iso_paths            = [var.os_iso_path,var.vmtools_iso_path]
  ip_wait_timeout      = var.ip_wait_timeout
  network_adapters {
    network      = var.vsphere_portgroup_name
    network_card = var.network_card
  }
  notes        = var.notes
  password     = var.vsphere_password
  communicator = var.communicator
  winrm_password = var.winrm_password
  winrm_timeout  = var.winrm_timeout
  winrm_username = var.winrm_user
  storage {
    disk_size             = var.disk_size
    disk_thin_provisioned = var.disk_thin_provisioned
  }
  username       = var.vsphere_user
  vcenter_server = var.vsphere_server
  vm_name        = var.vm_name
  vm_version     = var.vm_version
}
source "vsphere-iso" "win-2019-std-gui" {
  CPUs            = var.CPUs
  RAM             = var.RAM
  RAM_reserve_all = var.ram_reserve_all
  boot_command    = var.boot_command
  boot_order      = var.boot_order
  boot_wait       = var.boot_wait
  cluster         = var.vsphere_compute_cluster
  content_library_destination {
    destroy = var.library_vm_destroy
    library = var.content_library_destination
    name    = var.template_library_Name
    ovf     = var.ovf
  }
  datacenter           = var.vsphere_datacenter
  datastore            = var.vsphere_datastore
  disk_controller_type = var.disk_controller_type
  firmware             = var.firmware
  //remove and use http or install oscdimg
  floppy_files         = var.config_files
  folder               = var.vsphere_folder
  guest_os_type        = var.guest_os_type
  insecure_connection  = var.insecure_connection
  iso_paths            = [var.os_iso_path,var.vmtools_iso_path]
  ip_wait_timeout      = var.ip_wait_timeout
  network_adapters {
    network      = var.vsphere_portgroup_name
    network_card = var.network_card
  }
  notes        = var.notes
  password     = var.vsphere_password
  communicator = var.communicator
  winrm_password = var.winrm_password
  winrm_timeout  = var.winrm_timeout
  winrm_username = var.winrm_user
  storage {
    disk_size             = var.disk_size
    disk_thin_provisioned = var.disk_thin_provisioned
  }
  username       = var.vsphere_user
  vcenter_server = var.vsphere_server
  vm_name        = var.vm_name
  vm_version     = var.vm_version
}
build {
  name    = "Centos-7"
  sources = ["source.vsphere-iso.centos-7"]

  provisioner "shell" {
    execute_command = "echo '${"var.ssh_password"}' | sudo -S -E bash '{{ .Path }}'"
    scripts         = var.script_files
  }

  post-processor "manifest" {
    output = "output/out-centos7.json"
    strip_path = false
  }
}
build {
  name    = "win-2019-std-core"
  sources = ["source.vsphere-iso.win-2019-std-core"]

  provisioner "powershell" {
    scripts           = var.script_files
  }

  post-processor "manifest" {
    output = "output/out-win-2019-std-core.json"
    strip_path = false
  }
}
build {
  name    = "win-2019-std-gui"
  sources = ["source.vsphere-iso.win-2019-std-gui"]

  provisioner "powershell" {
    scripts           = var.script_files
  }

  post-processor "manifest" {
    output = "output/out-win-2019-std-gui.json"
    strip_path = false
  }
}