output "id" {
  description = "VM ID"
  value     = { for k,v in ovirt_vm.vm : k => v.id }
}

output "disk_id" {
  description = "VM Disk ID"
  value     = { for k,v in ovirt_disk.disk : k => v.id}
}
