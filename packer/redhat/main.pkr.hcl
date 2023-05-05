packer {
  required_plugins {
    amazon = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

build {
  sources = [
    "source.amazon-ebs.redhat-nvidia",
    "source.amazon-ebs.redhat-no-gpu"
  ]

  provisioner "ansible" {
    playbook_file   = "../../playbook.yml"
    user            = var.ami.communicator.username
  }
}
