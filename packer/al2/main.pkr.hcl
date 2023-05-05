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
    "source.amazon-ebs.al2-nvidia",
    "source.amazon-ebs.al2-no-gpu"
  ]

  provisioner "ansible" {
    playbook_file   = "../../playbook.yml"
    user            = var.ami.communicator.username
    extra_arguments = [
      "--extra-vars",
      "ansible_python_interpreter=/usr/bin/python"
    ]
  }
}
