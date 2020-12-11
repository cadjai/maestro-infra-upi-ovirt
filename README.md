# Ansible Collection - maestro-infra-upi-ovirt

This Ansible collection comprises several roles and plays as well as terraform modules to enable resource provisioning on various platforms. 
The first version will focus on using ovirt and then later use kvm and possibly openstack and any other virtulization platform without official terraform providers and modules. 
The current version assumes that you have Terraform v012 installed and that the ovirt provider plugin is also already installed and configured. 
There is an optional playbook to install Terraform but that is currently installing the latest version. 

---
**NOTE**

There currently is a bug in RHV/Ovirt whereby the attachment of multiple virtio-iscsi disks fails. 
There are several closed bugzilla related to the issue (1819162, 1506677). 
However it is still happening on RHV 4.3. 
This does not prevent the playbook from completing since that error is being ignored but need to be further investigated. All resources are being creatred but only the root disk and the first additional disk are attached. The others will need to be manually attached as a workaround for the time being.  
Another error is related to the terraform ovirt provider throwing an error when multiple ovirt_vm resources are being created. When given enough time the resources are all provisioned and therefore this error is also being ignored. 

This collection is relying on some external roles and collections some of which might not work out of box but due to the focus here we didn't spend time investigating them especially since there are other ways to solve that issue like importing your preferred role if you so choose. 
 
---

## Installation and Usage

### Installing the Collection from Ansible Galaxy
This is not hosted in galaxy yet. Therefore you will need to clone this repository and then 
run the ansible-galaxy command to install all required dependencies like for ansible roles. 
`ansible-galaxy install -r requirements.yml -p roles` 
Use `ansible-galaxy collection install -r requirements.yml` to install collections dependencies. 

### Prerequisites
It is assumed that you have Terrafom v012 installed and configured on the bastion and that you also have go installed in order to be able to build and run the terraform ovirt provider.  
For more information on how to install the provider please refer to https://github.com/oVirt/terraform-provider-ovirt.  
If this is being done in a disconnected environment ensure that the terraform ovirt provder bynary is collected and installed on the bastion as local terraform module. 
You also need ansible and python installed on the bastion. 
Most variables are defined in the vars/global.yml file but there are few that are defined as group variables for the various host groups you would like to create.  
Take a look at the inventory/group_vars folder to see some sample. 

### Playbooks
To run the main playbook use the ansible-playbook command as follows 
`ansible-plabook -i inventory/ site.yml`

To run a module or targeted playbook use the same command with the appropriate playbook. 
There are several dedicated modules depending on what you want to do. 
For example if you want to provision the various infra nodes (dhcp, dns, registry, loadbalancer...) use the provision-infra.yml playbbok. You can then configure the various nodes before provisioning cluster resources. 
To provision cluster resources use the provision-cluster.yml playbook. 
To pre-provision the RHCOS template to use during cluster resource provisining use the provision-rhcos-template.yml playbook. 
If your ignition files have been generated over 24 hours ago you can refresh them by running the refresh-ignition.yml playbook. 

A new vault file was added to store sensitive variables. There is a sample vault file named global-vault.example.yml under vars that shows the content of the vars/global-vault.yml file. Use that to create your own vault. 
To run any plabooks using the vault file use the following command: 
``` ansible-playbook -i inventory/ -i vars/global-vault.yml <playbook> --vault-id @prompt ```  

## Contributing


## Testing and Development


