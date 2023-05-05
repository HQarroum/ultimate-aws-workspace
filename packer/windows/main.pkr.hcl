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
    "source.amazon-ebs.windows-nvidia",
    "source.amazon-ebs.windows-amd",
    "source.amazon-ebs.windows-no-gpu"
  ]

  provisioner "ansible" {
    playbook_file    = "../../playbook.yml"
    user             = var.username
    use_proxy        = false
    extra_arguments  = [
      "--extra-vars", "ansible_winrm_server_cert_validation=ignore winrm_password=${build.Password}"
    ]
  }

  provisioner "powershell" {
    inline = [
      "& 'C:\\Program Files\\Amazon\\EC2Launch\\EC2Launch.exe' sysprep"
    ]
  }
}
