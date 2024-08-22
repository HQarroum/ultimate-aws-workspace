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
    "source.amazon-ebs.ubuntu-nvidia",
    "source.amazon-ebs.ubuntu-amd",
    "source.amazon-ebs.ubuntu-no-gpu"
  ]

  provisioner "ansible" {
    playbook_file = "../../playbook.yml"
    user          = var.ami.communicator.username
  }
}
