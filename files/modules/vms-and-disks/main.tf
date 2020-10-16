locals {
     vm_extra_disks = flatten([
       for vm_key, vm in var.vm_resources : [
         for disk_key, disk in vm.extra_disks : {
           vm_key      = vm_key
           disk_key    = disk_key
           disk_name   = disk.disk_name
           disk_size   = disk.disk_size
         }
        ]
     ])
}

resource "ovirt_disk" "disk" {

  for_each = {
    for adisk in local.vm_extra_disks : "${adisk.vm_key}-${adisk.disk_name}" => adisk
  }

  name              = each.value["disk_name"]
  alias             = each.key
  size              = each.value["disk_size"]
  format            = "${var.disk_format}"
  storage_domain_id = "${var.storage_domain_id}"
  sparse            = "${var.sparse}"
  shareable         = "${var.shareable}"

  timeouts {
    create = "6m"
    delete = "20m"
  }
}

resource "ovirt_vm" "vm" {
  for_each = var.vm_resources
  name			= each.key 
  clone			= "false"
  high_availability	= "true"
  cluster_id		= "${var.cluster_id}"
  memory		= each.value["vm_memory"]
  template_id		= each.value["vm_template_id"]
  cores			= each.value["vm_cores"]
  sockets		= each.value["vm_sockets"]
  
  initialization {
    authorized_ssh_key = each.value["vm_authorized_ssh_key"]
    host_name		= each.value["vm_hostname"]
    timezone		= "${var.vm_timezone}"
    custom_script	= each.value["vm_custom_script"]
    dns_search		= "${var.vm_dns_search}"
    dns_servers		= "${var.vm_dns_servers}"
    
    nic_configuration {
      label		= "${var.vm_nic_device}"
      boot_proto	= "${var.vm_nic_boot_proto}"
      address		= "${var.vm_nic_ip_address}"
      gateway		= "${var.vm_nic_gateway}"
      netmask		= "${var.vm_nic_netmask}"
      on_boot		= "${var.vm_nic_on_boot}"
    }
  }
  
  timeouts {
    create = "6m"
    delete = "20m"
  }
}

resource "ovirt_disk_attachment" "diskattachment" {
  for_each = {
    for disk in local.vm_extra_disks : "${disk.vm_key}-${disk.disk_name}" => disk
  }

  vm_id                 = ovirt_vm.vm[each.value.vm_key].id 
  disk_id               = ovirt_disk.disk[each.key].id
  active                = "${var.active}"
  bootable              = "${var.bootable}"
  interface             = "${var.interface}"
  read_only             = "${var.read_only}"
  use_scsi_reservation  = "${var.use_scsi_reservation}"

  timeouts {
    create = "6m"
    delete = "20m"
  }
}

