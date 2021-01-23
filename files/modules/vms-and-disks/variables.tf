variable "vm_resources" {
  description = "Containes information about the vms to be crearted "
  type	      = map(object({
    vm_name = string
    vm_memory = string
    vm_template_id = string
    vm_cores = number
    vm_sockets = number
    vm_hostname = string
    vm_authorized_ssh_key = string
    vm_custom_script = string
    extra_disks = map(object({
      disk_name = string
      disk_size = number
    }))
  }))
}

variable "cluster_id" {
  description = "The ID of cluster the VM belongs to"
  default     = ""
}
variable "vm_template_id" {
  description = "The name of the template the VM is created from"
  default     = ""
}
variable "vm_memory" {
  description = "The amount of memory allocated to the VM (in megabytes)"
  default     = "2048"
}
variable "vm_cpu_cores" {
  description = "The number of cores allocated to the VM"
  default     = "1"
}
variable "vm_cpu_sockets" {
  description = "The number of cpu sockets allocated to the VM"
  default     = "1"
}
variable "storage_domain_id" {
  default = ""
}
variable "disk_format" {
  default = "cow"
}
variable "sparse" {
  default = "true"
}
variable "shareable" {
  default = "false"
}
variable "active" {
  default = "true"
}
variable "bootable" {
  default = "false"
}
variable "interface" {
  default = "virtio"
}
variable "pass_discard" {
  default = ""
}
variable "read_only" {
  default = "false"
}
variable "use_scsi_reservation" {
  default = "false"
}
variable "vm_hostname" {
  description = "The hostname of the VM"
  default     = ""
}
variable "vm_timezone" {
  description = "The timezone configured for the VM when provisioned"
  default     = ""
}
variable "vm_user_name" {
  description = "The username for the VM"
  default     = ""
}
variable "vm_dns_search" {
  description = "The DNS search strings for the VM"
  default     = ""
}
variable "vm_dns_servers" {
  description = "The DNS server to configure for the VM if applicable"
  default     = ""
}

# Initialization - NIC Configuration
variable "vm_nic_device" {
  description = "The vNIC to apply to the network configuration for the VM"
  default     = ""
}
variable "vm_nic_boot_proto" {
  description = "The boot protocol for the vNIC configuration"
  default     = "dhcp"
}
variable "vm_nic_ip_address" {
  description = "The IP address assign to the vNIC if applicable"
  default     = ""
}
variable "vm_nic_gateway" {
  description = "The gateway for the vNIC if applicable"
  default     = ""
}
variable "vm_nic_netmask" {
  description = "The netmask to apply to the vNIC if applicable"
  default     = ""
}
variable "vm_nic_on_boot" {
  description = "The flag to indicate whether the vNIC will be activated on boot or not"
  default     = "true"
}
