//Defined User Variables for NorthComm's Lab Environment
template_library_Name   = "Centos7_latest"
vm_name                 = "centos7"
CPUs                    = "1"
RAM                     = "2048"
disk_size               = "61440"
firmware                = "bios"
vm_version              = "20"
notes                   = "Built via Packer with user defined variables"
guest_os_type           = "centos7_64Guest"
ssh_username            = "root"
ssh_password            = "VMware1!"
ssh_timeout             = "30m"
disk_controller_type    = ["pvscsi"]
os_iso_path             = "[vsanDatastore] /contentlib-53b21b84-ca26-4557-9b0d-f5690295735c/d710e243-3f1a-41db-b224-41344e8383c3/CentOS-7-x86_64-DVD-2003_8fd773a8-9ec6-4c62-b6c2-409803bcf411.iso"
vmtools_iso_path        = "[vsanDatastore] /contentlib-53b21b84-ca26-4557-9b0d-f5690295735c/5c0b4361-fcf6-40a2-acd4-9f3d05e67c18/linux_4362fa8e-a1fe-411d-83e4-b3f5cf2816eb.iso"
boot_wait               = "15s"
boot_command            = ["<up><wait><tab><wait> inst.text inst.ks=hd:fd0:/ks.cfg <enter><wait>"]
config_files            = ["config/ks.cfg"]
script_files            = ["scripts/install-vmtools.sh","scripts/update.sh"]
