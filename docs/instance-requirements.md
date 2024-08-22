# Instance Requirements

The cloud desktop has been tested on different EC2 instance types with both GPU and non GPU instances. This documentation provides you with an overview of the recommended settings for your EC2 instances.

## 🖴 Disk Storage

This section provides an overview of the amount of EBS storage to provision your instances given the packages and configuration that gets provisioned on the instances, with enough head room for development.

Type             | Disk Size | EBS Type
---------------- | --------- | --------
Minimum          |  40 GB    | NVMe gp2
Recommended      |  120 GB   | NVMe gp2
High-Performance |  200 GB   | NVMe gp3 + Provisioned IOPS

## 💻 Instance Type

This section details the recommended GPU and non GPU instance types.

> The Ansible role will configure the instance appropriately whether it has a GPU or not, as such, non-GPU instances are also supported.

Type        | Instance Type | GPU enabled ?
----------- | ------------- | -------------
Minimum     |   t2.large    |     No
Recommended |  g4dn.xlarge  |     Yes

> AMD GPUs (g4ad instance types) are also supported, but have less support across the operating systems than NVIDIA GPUs ([More Information](./technical-overview.md)).

## 🔒 Security Requirements

### Security Groups

You need to have SSH (Linux) or WinRM (Windows) access to your instances in order to be able to provision them using the Ansible role provided by this project. Additionally, the NiceDCV low-latency server that provides access to the instances user interface listens on specific TCP and UDP ports that needs to be accessible from your instance.

Below is a detail of the ports that needs to be made available to your instance.

Port | Protocol | Operating System | Description
---- | -------- | ---------------- | -----------
22   |    TCP   |      Linux       | (Linux Only) - SSH access for initial instance provisioning using the Ansible role. If you are using Packer, you do not need to open this port.
5986 |    TCP   |     Windows      | (Windows Only) - WinRM access for initial instance provisioning using the Ansible role. If you are using Packer, you do not need to open this port.
8443 |    TCP   |       All        | Provides access to the NiceDCV server over TCP.
8443 |    UDP   |       All        | Provides access to the NiceDCV server over UDP.

### IAM Role Requirements

When you use an EC2 instance, it is recommended that you specify an IAM Role for that instance that has the `AmazonSSMManagedInstanceCore` policy which allows your instance to be managed by AWS SSM.

Furthermore, you will need to allow the instance access to a specific AWS provided S3 bucket for Nice DCV licenses which are included in the EC2 offering. To do so, please follow the [Setting Up License](https://docs.aws.amazon.com/dcv/latest/adminguide/setting-up-license.html#setting-up-license-ec2) page for Nice DCV for ensuring your instance's Nice DCV server is provisioned with an appropriate license.

### Windows WinRM

For Windows instances, when using the ansible role to provision your instance, you need to enable WinRM on the instance. This involves an additional step of connecting via RDP to the instance, and running the [ConfigureRemotingForAnsible.ps1](../assets/ConfigureRemotingForAnsible.ps1) script on the instance to enable the WinRM service.
