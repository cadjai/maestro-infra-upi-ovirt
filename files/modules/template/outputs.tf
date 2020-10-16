output "rhcos_template_id" {
  description = "VM Template ID"
  value     = data.ovirt_templates.rhcos_tmp_templates.templates.0.id
}

output "rhcos_template_vm_id" {
  description = "RHCOS VM ID"
  value     = { for k,v in data.ovirt_vms.rhcos_tmp_vm_vms.vms : k => v.id } 
}
