// variables.pkr.hcl
packer {
  required_version = ">= 1.7.0"
  required_plugins {
    vsphere = {
      source  = "github.com/hashicorp/vsphere"
      version = "~> 1"
    }
    vmware = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/vmware"
    }
    windows-update = {
      version = ">= 0.14.1"
      source = "github.com/rgl/windows-update"
    }
  }
}
variable "vsphere_server" {
  type    = string
  default = "genvcs01.pkbiz.vmware.int"
  description = "vCenter Server"
}
variable "vsphere_user" {
  type      = string
  default   = "hbadmin@vsphere.local"
  sensitive = true
}
variable "vsphere_password" {
  type  = string
  default = "VMware123!" // vCenter administrtor user's password 
  sensitive = true
}
variable "insecure_connection" {
  type    = bool
  default = false
  description = "Requires the target vCenter Server to have a valid, trust certificate"
}
variable "vsphere_folder" {
  type    = string
  default = "Temp"
  description = "Folder that the VM will temporarily be storaged in while before upload to the content library"
}
variable "vsphere_datacenter" {
    type    = string
    default = "RaycomDC"
    description = "Target Datacenter for the deployment"
}
variable "vsphere_compute_cluster" {
    type    = string
    default = "vSAN"
    description = "Target Cluster for the deployment"
}
variable "vsphere_portgroup_name" {
    type    = string
    default = "Private-Halin"
    description = "Target Portgroup/network for the deployment (PXE enabled with internet access for Windows patching)"
}
variable "vsphere_datastore" {
    type    = string
    default = "vsanDatastore"
    description = "Target Datacenter for the deployment"
}
variable "content_library_destination" {
  type    = string
  default = "iso"
  description = "Name of the content library the template will be uploaded to"
}
variable "template_library_Name" {
  type = string
  description = "Name of template"
}
variable "library_vm_destroy" {
  type    = bool
  default = true
  description = "Destroys the original VM template from the inventory once its has been uploaded to the content library"
}
variable "ovf" {
  type    = bool
  default = true
  description = "Template will be uploaded to the content library in the OVF format"
}
variable "vm_name" {
  type = string
  description = "Name of the VM (temporary)"
}
variable "CPUs" {
  type = string
  default = "2"
  description = "Amount of vCPU's that are to be allocated to the Template VM"
}
variable "RAM" {
  type = string
  default = "4096"
  description = "Amount of memory to be allocated to the template"
}
variable "disk_size" {
  type = string
  default = "614400"
  description = "Size of the OS disk in MB"
}
variable "firmware" {
  type = string
  default = "efi"
  description = "Firmware for the template"
}
variable "vm_version" {
  type = string
  default = "20"
  description = "VM Hardware Version.  Default should be the minimum common version for the versions of vSphere the template will be used"
}
variable "notes" {
  type = string
  description = "Any notes to be added to the template object"
}
variable "template_library_description" {
  type    = string
}
variable "guest_os_type" {
  type = string
  description = "Version of the guest operating system.  This uses the VMware OS type codes"
}
variable "boot_order" {
  type    = string
  default = "disk,cdrom"
}
variable "communicator" {
  type = string
  default = "winrm"
  description = "WinRM or SSH depending on the OS you are connecting to"
}
variable "winrm_user" {
  type      = string
  sensitive = true
  description = "Windows user to continue configuration"
}
variable "winrm_password" {
  type      = string
  sensitive = true
  description = "Password for winrm_user"
}
variable "winrm_timeout" {
  type = string
  default = "30m"
  description = "Timeout value for how long Packer should wait for WinRM to become available once an IP has been assigned"
}
variable "disk_controller_type" {
    type    = list(string)
    default = ["pvscsi"]
    description = "VM disk controller type"
}
variable "disk_thin_provisioned" {
  type    = bool
  default = true
  description = "Disk type, Thin/Thick etc"
}
variable "network_card" {
  type    = string
  default = "vmxnet3"
  description = "Virtual NIC type"
}
variable "os_iso_path" {
  type    = string
  description = "Path to the OS ISO file including the datastore name"
}
variable "vmtools_iso_path" {
  type    = string
  description = "Path to the VMware Tools ISO file including the datastore name"
}
variable "boot_wait" {
  type    = string
  description = "Delay in seconds for when Packer should begin sending the boot command key strokes"
}
variable "boot_command" {
  type    = list(string)
  description = "Boot command key strokes to be sent to the VM"
}
variable "config_files" {
    type    = list(string)
  description = "Specify all files and folders that need to be made available to the OS during install"
}
variable "script_files" {
    type    = list(string)
  description = "Specify all files and folders that need to be made available AFTER the OS install"
}
variable "final_script_files" {
  type    = list(string)
  description = "Specify all files and folders that need to be made available AFTER the OS upgraded"
}
