packer {
  required_plugins {
    amazon = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

build {
  sources = [
    "source.amazon-ebs.redhat-nvidia",
    "source.amazon-ebs.redhat-no-gpu"
  ]

  provisioner "ansible" {
    playbook_file = "../../playbook.yml"
    user          = var.ami.communicator.username
  }
}
