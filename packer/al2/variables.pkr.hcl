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
      communicator    = string
      port            = number
      username        = string
    })
  })
  description         = "The properties for an Amazon Linux 2 AMI."
  default = {
    prefix            = "aws-ultimate-workspace-al2-hvm-x86_64-ebs"
    source_ami_filter = {
      virtualization  = "hvm"
      regex           = "amzn2-ami-kernel-*-hvm-*-x86_64-*"
      device          = "ebs"
      owners          = ["amazon"]
    }
    communicator      = {
      communicator    = "ssh"
      port            = 22
      username        = "ec2-user"
    }
  }
}

/**
 * Defines the attributes of the EBS volume.
 */
variable block_device {
  type = object({
    device_name           = string
    volume_size           = number
    volume_type           = string
    delete_on_termination = bool
  })
  description             = "Attributes associated with the instance block device"
  default = {
    device_name           = "/dev/xvda"
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
