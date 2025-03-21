locals {
  build_time = formatdate("DD-MM-YYYY-hh-mm", timestamp())
}

source "amazon-ebs" "windows-nvidia" {
  ami_name                    = "${var.ami.prefix}-nvidia-${local.build_time}"
  ami_description             = "An AMI providing a Windows Server 2022 based instance with support for NVIDIA GPUs."
  instance_type               = var.instance_type_nvidia
  region                      = var.region
  communicator                = var.ami.communicator.name
  associate_public_ip_address = true
  winrm_username              = var.username
  winrm_port                  = var.ami.communicator.port
  winrm_use_ssl               = true
  winrm_insecure              = true
  subnet_id                   = var.subnet_id != "" ? var.subnet_id : null
  
  source_ami_filter {
    filters = {
      name                = var.ami.source_ami_filter["regex"]
      virtualization-type = var.ami.source_ami_filter["virtualization"]
      root-device-type    = var.ami.source_ami_filter["device"]
    }
    owners      = var.ami.source_ami_filter["owners"]
    most_recent = true
  }

  launch_block_device_mappings {
    device_name           = var.block_device.device_name
    volume_size           = var.block_device.volume_size
    volume_type           = var.block_device.volume_type
    delete_on_termination = var.block_device.delete_on_termination
  }

  user_data_file = "./scripts/user-data.txt"
  tags           = var.tags
}

source "amazon-ebs" "windows-amd" {
  ami_name                    = "${var.ami.prefix}-amd-${local.build_time}"
  ami_description             = "An AMI providing a Windows Server 2022 based instance with support for AMD GPUs."
  instance_type               = var.instance_type_amd
  region                      = var.region
  communicator                = var.ami.communicator.name
  associate_public_ip_address = true
  winrm_username              = var.username
  winrm_port                  = var.ami.communicator.port
  winrm_use_ssl               = true
  winrm_insecure              = true
  subnet_id                   = var.subnet_id != "" ? var.subnet_id : null
  
  source_ami_filter {
    filters = {
      name                = var.ami.source_ami_filter["regex"]
      virtualization-type = var.ami.source_ami_filter["virtualization"]
      root-device-type    = var.ami.source_ami_filter["device"]
    }
    owners      = var.ami.source_ami_filter["owners"]
    most_recent = true
  }

  launch_block_device_mappings {
    device_name           = var.block_device.device_name
    volume_size           = var.block_device.volume_size
    volume_type           = var.block_device.volume_type
    delete_on_termination = var.block_device.delete_on_termination
  }

  user_data_file = "./scripts/user-data.txt"
  tags           = var.tags
}

source "amazon-ebs" "windows-no-gpu" {
  ami_name                    = "${var.ami.prefix}-no-gpu-${local.build_time}"
  ami_description             = "An AMI providing a Windows Server 2022 based instance with Dummy GPU Drivers."
  instance_type               = var.instance_type_no_gpu
  region                      = var.region
  communicator                = var.ami.communicator.name
  associate_public_ip_address = true
  winrm_username              = var.username
  winrm_port                  = var.ami.communicator.port
  winrm_use_ssl               = true
  winrm_insecure              = true
  subnet_id                   = var.subnet_id != "" ? var.subnet_id : null
  
  source_ami_filter {
    filters = {
      name                = var.ami.source_ami_filter["regex"]
      virtualization-type = var.ami.source_ami_filter["virtualization"]
      root-device-type    = var.ami.source_ami_filter["device"]
    }
    owners      = var.ami.source_ami_filter["owners"]
    most_recent = true
  }

  launch_block_device_mappings {
    device_name           = var.block_device.device_name
    volume_size           = var.block_device.volume_size
    volume_type           = var.block_device.volume_type
    delete_on_termination = var.block_device.delete_on_termination
  }

  user_data_file = "./scripts/user-data.txt"
  tags           = var.tags
}