
data "ovirt_clusters" "clusters" {
  search = {
    criteria       = ""
    case_sensitive = false
  }
}

data "ovirt_vnic_profiles" "vnic_profiles" {
  name_regex = "ovirtmgmt"
  network_id = local.network_id
}

locals {
     cluster	    	= [for c in data.ovirt_clusters.clusters.clusters : c if c.id == var.cluster_id][0]
     network_id	    	= [for n in local.cluster.networks : n.id if n.name == "ovirtmgmt"][0]
     vnic_profile_id	= data.ovirt_vnic_profiles.vnic_profiles.vnic_profiles.0.id
     
}

resource "ovirt_image_transfer" "rhcos_release_image" {
  source_url		= "${var.rhcos_image_url}"
  storage_domain_id 	= "${var.storage_domain_id}"
  sparse            	= "${var.sparse}"
  alias			= "${var.rhcos_template_name}"
}

resource "ovirt_vm" "rhcos_tmp_vm" {
  cluster_id		= "${var.cluster_id}"
  name			= "rhcos_tmp_vm-${var.rhcos_template_name}"
  block_device {
    disk_id	= ovirt_image_transfer.rhcos_release_image.disk_id
    interface	= "virtio_scsi"
    size	= 120
  }
  auto_start 		= false
  os {
    type = "rhcos_x64"
  }
  nics {
    name		= "nic1"
    vnic_profile_id	= local.vnic_profile_id
  }
  depends_on 		= [ovirt_image_transfer.rhcos_release_image]
}

data "ovirt_vms" "rhcos_tmp_vm_vms" {
  search = {
    criteria       = "name=rhcos_tmp_vm-${var.rhcos_template_name}"
    case_sensitive = true
  }
  depends_on 		= [ovirt_vm.rhcos_tmp_vm]
}

resource "ovirt_template" "rhcos_tmp_template" {
  count			= var.create_template ? 1 : 0
  name			= "${var.rhcos_template_name}"  
  cluster_id		= "${var.cluster_id}"
  vm_id			= ovirt_vm.rhcos_tmp_vm.id
}

data "ovirt_templates" "rhcos_tmp_templates" {
  search = {
    criteria       = "name=${var.rhcos_template_name}"
    case_sensitive = true
  }
  depends_on 		= [ovirt_template.rhcos_tmp_template]
}
