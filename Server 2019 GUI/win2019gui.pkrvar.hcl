//Defined User Variables
template_library_Name   = "window2019std_latest"
vm_name                 = "windows-2019-std-gui"
CPUs                    = "2"
RAM                     = "4096"
disk_size               = "61440"
notes                   = "Built via Packer with user defined variables"
template_library_description = "Built via Packer with new patchers  in {{isotime `2006-01-02`}}"
guest_os_type           = "windows2019srv_64Guest"
winrm_user              = "hbadmin"
winrm_password          = "HBVMware123!"
os_iso_path             = "[vsanDatastore] /contentlib-53b21b84-ca26-4557-9b0d-f5690295735c/91c1876f-90ae-4cb7-96cf-c434e038c40e/Win_Server_STD_2019_1809_MLF_X23_CN_26de23c7-6d40-4e7e-bd7a-327fb2e077bc.iso"
vmtools_iso_path        = "[vsanDatastore] /contentlib-53b21b84-ca26-4557-9b0d-f5690295735c/6240b48c-71b7-4108-9958-29f136abda7a/vmware-tools-windows_71be25d0-f9d5-41e8-bb51-f18b82aee901.iso"
boot_wait               = "3s"
boot_command            = ["<spacebar>"]
config_files            = ["config/autounattend.xml","scripts/pvscsi","scripts/install-vm-tools.cmd","scripts/enable-winrm.ps1","scripts/psrepo_nuget.ps1","scripts/install-psmodules.ps1"]
script_files            = ["scripts/enable-rdp.cmd","scripts/disable-tls.ps1"]
final_script_files      = ["scripts/disableadmin.cmd"]
