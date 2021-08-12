//Defined User Variables
vsphere_datacenter      = "dc-smt-01"
vsphere_password        = "VMware123!"
vsphere_compute_cluster = "cl-vsan-01"
vsphere_portgroup_name  = "dvPG_Demo_DHCP_149"
vsphere_datastore       = "ds-vsan-01"
template_library_Name   = "win-2019-std-core"
vm_name                 = "windows-2019-std-core"
CPUs                    = "2"
RAM                     = "2048"
disk_size               = "61440"
notes                   = "Built via Packer with user defined variables"
guest_os_type           = "windows2019srv_64Guest"
winrm_user              = "administrator"
winrm_password          = "VMware123!"
os_iso_path             = "[ds-vsan-01] /Media/windows_server_2019.iso"
vmtools_iso_path        = "[ds-vsan-01] /Media/VMTools/windows.iso"
http_directory          = "E:\\Media/"
http_port_max           = 8000
boot_wait               = "3s"
boot_command            = ["<spacebar>"]
config_files            = ["config/autounattend.xml","scripts/pvscsi","scripts/install-vm-tools.cmd","scripts/enable-winrm.ps1","scripts/os-configuration.ps1"]
script_files            = ["scripts/package-installations.ps1"]
cleanup                 = ["scripts/cleanup.ps1"]