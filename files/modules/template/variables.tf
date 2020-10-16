
variable "cluster_id" {
  description = "The ID of cluster the VM belongs to"
  default     = ""
}
variable "rhcos_template_name" {
  description = "The name of the template the VM is created from"
  default     = ""
}
variable "rhcos_image_url" {
  description = "The URL of the RHCOS Openstack qcow2 image to use to generate the template from which vms are created"
  default     = ""
}
variable "create_template" {
  description = "Indicates if a template need to be created or not. Set to 1 to create template"
  type	      = bool 
  default     = false
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
variable "interface" {
  default = "virtio_scsi"
}
