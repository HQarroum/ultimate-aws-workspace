variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "instance_type_nvidia" {
  type        = string
  description = "The instance type to use to build your aws AMI"
  default     = "g4dn.xlarge"
}

variable "instance_type_amd" {
  type        = string
  description = "The instance type to use to build your aws AMI"
  default     = "g4ad.xlarge"
}

variable "instance_type_no_gpu" {
  type        = string
  description = "The instance type to use to build your aws AMI"
  default     = "m5.xlarge"
}

variable "username" {
  type        = string
  description = "The WinRM username to use to provision an instance"
  default     = "Administrator"
}

variable ami {
  type = object({
    prefix            = string
    source_ami_filter = object({
      virtualization  = string
      regex           = string
      device          = string
      owners          = list(string)
    })
    communicator      = object({
      name            = string
      port            = number
    })
  })
  description = "The properties for a Windows Server 2022 AMI."
  default = {
    prefix            = "aws-ultimate-workspace-windows-server-2022-hvm-x86_64-ebs"
    source_ami_filter = {
      virtualization  = "hvm"
      regex           = "Windows_Server-2022-English-Full-Base*"
      device          = "ebs"
      owners          = ["amazon"]
    }
    communicator      = {
      name            = "winrm"
      port            = 5986
    }
  }
}

/**
 * Defines an EBS volume of 200GB.
 */
variable block_device {
  type = object({
    device_name           = string
    volume_size           = number
    volume_type           = string
    delete_on_termination = bool
  })
  description = "Attributes associated with the instance block device"
  default = {
    device_name           = "/dev/sda1"
    volume_size           = 250
    volume_type           = "gp2"
    delete_on_termination = true
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags associated with the AMI."
  default     = {}
}
