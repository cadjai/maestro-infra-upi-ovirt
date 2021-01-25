RedHat Subscription
=========

Registers and attaches a system to a RedHat subscription.

Requirements
------------

RedHat EL subscription and system.

Role Variables
--------------

To subscribe using a username and password define the following variables
wherever appropriate. It is recommended that they be encrypted and the
example shows this.
```yml
redhat_subscription_username: "{{ _vault_redhat_subscription_username }}"
redhat_subscription_password: "{{ _vault_redhat_subscription_password }}"
```

To subscribe using a activation key:
```yml
redhat_subscription_org_id:
redhat_subscription_activationkey:
```

To resume a subscription on a system specify the UUID in the following
variable. This should be defined either in a file in the **host_vars**
directory or in the inventory file.

```yml
redhat_subscription_consumer_id:
```

Optional variables:
```yml
# List of repositories to enable.
redhat_subscription_repositories: []

# List of respositories to disable.
redhat_subscription_repositories_disable: []
```

**Repositories**
- rhel-7-server-dotnet-debug-rpms
- rhel-7-server-satellite-tools-6.2-rpms
- rhel-7-server-v2vwin-1-debug-rpms
- rhel-7-server-insights-3-debug-rpms
- rhel-rs-for-rhel-7-server-fastrack-debug-rpms
- rhel-rs-for-rhel-7-server-eus-source-rpms
- rhel-7-server-openstack-11-tools-debug-rpms
- rhel-atomic-7-cdk-2.3-rpms
- rhel-server-rhscl-7-eus-source-rpms
- rhel-7-server-eus-rh-common-rpms
- rhel-ha-for-rhel-7-server-fastrack-rpms
- rhel-rs-for-rhel-7-server-eus-rpms
- rhel-7-server-rhceph-2-tools-rpms
- rhel-7-server-eus-debug-rpms
- rhel-7-server-devtools-beta-source-rpms
- rhel-7-server-extras-rpms
- rhel-7-server-rh-common-debug-rpms
- rhel-atomic-host-beta-debug-rpms
- rhel-7-server-rhn-tools-beta-rpms
- rhel-7-server-supplementary-debug-rpms
- rhel-7-server-satellite-tools-6.1-debug-rpms
- rhel-server-rhscl-7-beta-source-rpms
- rhel-7-server-devtools-beta-rpms
- rhel-7-server-eus-satellite-tools-6.1-debug-rpms
- rhel-7-server-eus-source-rpms
- rhel-7-server-openstack-7.0-tools-rpms
- rhel-7-server-devtools-source-rpms
- rhel-7-server-satellite-maintenance-6-debug-rpms
- rhel-ha-for-rhel-7-server-eus-debug-rpms
- rhel-rs-for-rhel-7-server-debug-rpms
- rhel-7-server-optional-beta-debug-rpms
- rhel-rs-for-rhel-7-server-source-rpms
- rhel-server-rhscl-7-beta-debug-rpms
- rh-gluster-3-client-for-rhel-7-server-debug-rpms
- rhel-7-server-optional-fastrack-debug-rpms
- rhel-7-server-satellite-tools-6.2-source-rpms
- rhel-7-server-openstack-9-tools-rpms
- rhel-7-server-eus-rh-common-debug-rpms
- rhel-ha-for-rhel-7-server-fastrack-debug-rpms
- rhel-ha-for-rhel-7-server-eus-rpms
- rhel-7-server-satellite-tools-6.2-debug-rpms
- rhel-7-server-eus-satellite-tools-6.1-source-rpms
- rhel-7-server-supplementary-beta-source-rpms
- rhel-7-server-rt-beta-debug-rpms
- rhel-7-server-satellite-tools-6-beta-source-rpms
- rhel-7-server-openstack-10-tools-debug-rpms
- rhel-7-server-eus-rh-common-source-rpms
- rhel-7-server-eus-rpms
- rhel-7-server-openstack-9-tools-source-rpms
- rhel-7-server-thirdparty-oracle-java-beta-source-rpms
- rhel-7-server-openstack-10-tools-source-rpms
- rhel-7-server-beta-rpms
- rhel-7-server-optional-debug-rpms
- rhel-7-server-eus-supplementary-source-rpms
- rhel-ha-for-rhel-7-server-source-rpms
- rhel-7-server-rhceph-1.3-tools-debug-rpms
- rhel-7-server-openstack-10-tools-rpms
- rhel-ha-for-rhel-7-server-eus-source-rpms
- rhel-server-rhscl-7-eus-debug-rpms
- rhel-7-server-eus-satellite-tools-6.2-source-rpms
- rhel-atomic-7-cdk-3.0-beta-debug-rpms
- rhel-atomic-7-cdk-2.4-debug-rpms
- rhel-sjis-for-rhel-7-server-eus-source-rpms
- rhel-7-server-eus-supplementary-rpms
- rhel-7-server-extras-beta-debug-rpms
- rhel-server-rhscl-7-rpms
- rhel-7-server-rt-beta-rpms
- rhel-7-server-eus-satellite-tools-6.2-debug-rpms
- rhel-7-server-rhn-tools-rpms
- rhel-atomic-7-cdk-3.1-rpms
- rhel-rs-for-rhel-7-server-fastrack-rpms
- rhel-atomic-7-cdk-3.0-rpms
- rhel-atomic-7-cdk-2.3-debug-rpms
- rhel-7-server-rhceph-1.3-tools-source-rpms
- rhel-7-server-thirdparty-oracle-java-rpms
- rhel-atomic-7-cdk-3.1-debug-rpms
- rhel-7-server-fastrack-rpms
- rhel-7-server-eus-satellite-tools-6.2-rpms
- rhel-7-server-dotnet-rpms
- rhel-7-server-optional-fastrack-rpms
- rhel-7-server-thirdparty-oracle-java-beta-rpms
- rhel-atomic-host-rpms
- rhel-7-server-eus-rhn-tools-source-rpms
- rhel-7-server-rhn-tools-beta-source-rpms
- rhel-7-server-source-rpms
- rhel-7-server-extras-source-rpms
- rhel-7-server-openstack-7.0-tools-debug-rpms
- rhel-atomic-host-source-rpms
- rhel-atomic-7-cdk-2.4-rpms
- rhel-7-server-rt-beta-source-rpms
- rhel-atomic-host-beta-rpms
- rhel-rs-for-rhel-7-server-beta-debug-rpms
- rhel-atomic-host-debug-rpms
- rhel-rs-for-rhel-7-server-rpms
- rhel-atomic-host-beta-source-rpms
- rhel-7-server-optional-source-rpms
- rhel-7-server-rhn-tools-beta-debug-rpms
- rhel-7-server-insights-3-rpms
- rhel-server-rhscl-7-beta-rpms
- rhel-7-server-satellite-maintenance-6-rpms
- rhel-7-server-openstack-9-tools-debug-rpms
- rhel-7-server-satellite-tools-6-beta-rpms
- rhel-7-server-eus-satellite-tools-6.1-rpms
- rhel-7-server-v2vwin-1-rpms
- rhel-7-server-extras-beta-source-rpms
- rhel-atomic-7-cdk-2.4-source-rpms
- rhel-7-server-dotnet-beta-debug-rpms
- rhel-rs-for-rhel-7-server-eus-debug-rpms
- rhel-7-server-openstack-11-tools-rpms
- rhel-7-server-rhceph-2-tools-debug-rpms
- rhel-7-server-rh-common-beta-rpms
- rhel-7-server-eus-optional-rpms
- rhel-server-rhscl-7-debug-rpms
- rhel-7-server-insights-3-source-rpms
- rhel-7-server-v2vwin-1-source-rpms
- rhel-7-server-extras-debug-rpms
- rhel-7-server-debug-rpms
- rhel-server-rhscl-7-source-rpms
- rhel-ha-for-rhel-7-server-beta-source-rpms
- rhel-7-server-rt-debug-rpms
- rhel-7-server-rh-common-rpms
- rhel-7-server-dotnet-beta-rpms
- rhel-7-server-satellite-tools-6.1-rpms
- rhel-7-server-satellite-tools-6.1-source-rpms
- rhel-7-server-eus-optional-source-rpms
- rhel-atomic-7-cdk-3.0-beta-source-rpms
- rhel-atomic-7-cdk-3.1-source-rpms
- rhel-7-server-rh-common-beta-source-rpms
- rhel-7-server-fastrack-source-rpms
- rhel-7-server-satellite-maintenance-6-source-rpms
- rhel-7-server-eus-supplementary-debuginfo
- rhel-ha-for-rhel-7-server-rpms
- rhel-7-server-supplementary-beta-rpms
- rhel-7-server-optional-beta-source-rpms
- rhel-7-server-eus-thirdparty-oracle-java-rpms
- rhel-atomic-7-cdk-2.2-rpms
- rhel-7-server-rh-common-source-rpms
- rhel-7-server-rhceph-2-tools-source-rpms
- rhel-rs-for-rhel-7-server-beta-source-rpms
- rhel-7-server-rhn-tools-debug-rpms
- rhel-7-server-eus-rhn-tools-rpms
- rhel-7-server-devtools-beta-debug-rpms
- rhel-7-server-rpms
- rhel-rs-for-rhel-7-server-fastrack-source-rpms
- rh-gluster-3-client-for-rhel-7-server-rpms
- rhel-7-server-openstack-8-tools-source-rpms
- rhel-server-rhscl-7-eus-rpms
- rhel-7-server-supplementary-beta-debug-rpms
- rh-gluster-3-client-for-rhel-7-server-source-rpms
- rhel-7-server-rt-source-rpms
- rhel-atomic-7-cdk-3.0-source-rpms
- rhel-ha-for-rhel-7-server-beta-debug-rpms
- rhel-7-server-eus-optional-debug-rpms
- rhel-ha-for-rhel-7-server-beta-rpms
- rhel-7-server-rhn-tools-source-rpms
- rhel-7-server-rh-common-beta-debug-rpms
- rhel-7-server-openstack-8-tools-rpms
- rhel-7-server-rhceph-1.3-tools-rpms
- rhel-7-server-fastrack-debug-rpms
- rhel-7-server-satellite-tools-6-beta-debug-rpms
- rhel-sjis-for-rhel-7-server-eus-debug-rpms
- rhel-7-server-dotnet-beta-source-rpms
- rhel-atomic-7-cdk-2.2-source-rpms
- rhel-7-server-openstack-8-tools-debug-rpms
- rhel-7-server-thirdparty-oracle-java-source-rpms
- rhel-7-server-extras-beta-rpms
- rhel-7-server-devtools-rpms
- rhel-7-server-dotnet-source-rpms
- rhel-atomic-7-cdk-3.0-debug-rpms
- rhel-ha-for-rhel-7-server-fastrack-source-rpms
- rhel-ha-for-rhel-7-server-debug-rpms
- rhel-7-server-supplementary-rpms
- rhel-7-server-devtools-debug-rpms
- rhel-7-server-rt-rpms
- rhel-7-server-eus-thirdparty-oracle-java-source-rpms
- rhel-7-server-openstack-11-tools-source-rpms
- rhel-7-server-optional-rpms
- rhel-7-server-eus-rhn-tools-debug-rpms
- rhel-7-server-beta-source-rpms
- rhel-atomic-7-cdk-2.2-debug-rpms
- rhel-7-server-beta-debug-rpms
- rhel-7-server-optional-fastrack-source-rpms
- rhel-rs-for-rhel-7-server-beta-rpms
- rhel-7-server-supplementary-source-rpms
- rhel-sjis-for-rhel-7-server-eus-rpms
- rhel-atomic-7-cdk-2.3-source-rpms
- rhel-7-server-openstack-7.0-tools-source-rpms
- rhel-7-server-optional-beta-rpms

Dependencies
------------

None.

Example Playbook
----------------

```yml
- hosts: RedHat-Systems
  roles:
    - the-paulus.redhat-subscription
```

```yml
- hosts: all
  roles:
    - { role: the-paulus.redhat-subscription, when: ansible_distribution == 'RedHat' }
```

License
-------

BSD
