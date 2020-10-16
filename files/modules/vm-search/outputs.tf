locals {
  created_vm_list = "data.ovirt_vms.${var.vm_list_name}.vms"
  cvm_reported_dev_list = "data.ovirt_vms.${var.vm_list_name}.vms.0.reported_devices"
  cvm_dev_id = "data.ovirt_vms.${var.vm_list_name}.vms.0.id"
}
output "created_vms" {
  value         = local.created_vm_list
}
output "reported_devices" {
  value         = local.cvm_reported_dev_list
}
output "created_vm_id" {
  value		= local.cvm_dev_id
}
