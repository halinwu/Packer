// variables.pkr.hcl for NorthComm's Lab Environment
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
  default = "***********"  //Please input the Correct administraotr password 
  sensitive = true
}
variable "insecure_connection" {
  type    = bool
  default = true
}
variable "vsphere_folder" {
  type    = string
  default = "Temp"
}
variable "vsphere_datacenter" {
  type    = string
  default = "RaycomDC"
}
variable "vsphere_compute_cluster" {
  type    = string
  default = "vSAN"
}
variable "vsphere_portgroup_name" {
  type    = string
  default = "Private-Halin"
}
variable "vsphere_datastore" {
type    = string
  default = "vsanDatastore"
}
variable "content_library_destination" {
  type    = string
  default = "iso"
}
variable "template_library_Name" {
  type = string
}
variable "library_vm_destroy" {
  type    = bool
  default = true
}
variable "ovf" {
  type    = bool
  default = true
}
variable "vm_name"   {}
variable "CPUs"      {}
variable "RAM"       {}
variable "disk_size" {}
variable "ram_reserve_all" {
  type    = bool
  default = true
}
variable "firmware"  {}
variable "vm_version" {}
variable "notes"     {}
variable "guest_os_type" {}
variable "ssh_username"  {}
variable "ssh_password"  {}
variable "ssh_timeout"   {}
variable "disk_controller_type" {}
variable "disk_thin_provisioned" {
  type    = bool
  default = true
}
variable "network_card" {
  type    = string
  default = "vmxnet3"
}

variable "os_iso_path"	{}
variable "vmtools_iso_path" {}
variable "boot_wait"    {}
variable "boot_order" {
  type    = string
  default = "disk,cdrom"
}
variable "boot_command" {}
variable "config_files" {}
variable "script_files" {}
