data "ovirt_vms" "vms" {
  name_regex = "${var.vm_name}"
}
