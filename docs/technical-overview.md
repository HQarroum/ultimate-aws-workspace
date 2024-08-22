# Technical Overview

This section provides some technical documentation about components built into the produced images, along with additional information such as the known issues.

## GPU Integration

AWS provides instances powered by both NVIDIA and AMD graphics card. This implementation partially covers the different combination of instance types and GPU vendors. Below is a matrix documenting what is currently supported by the Ansible template provided in this repository.

Operating System | NVIDIA T4 (G4 Instances) | NVIDIA A10G (G5 Instances) | AMD v520 | Dummy Driver (no GPU)
---------------- | ------------------------ | -------------------------- | -------- | ---------------------
Ubuntu 22.04     |           ✅             |             ✅             |    ⚠️*    |          ✅
RedHat 9         |           ✅             |             ✅             |    ❌**  |          ✅
Windows          |           ✅             |             ✅             |    ✅    |          ✅

> \* On Ubuntu, OpenCL is not enabled on the installed AMD drivers, only the OpenGL support is installed because of difficulties in building the driver.
> ** On RedHat 9, the AMD driver does not seem compatible with the system. More investigations are required to find the root cause of the problem.

Non-GPU instances will generally feel more laggy, and animations will tend to be disabled by the desktop manager, while GPU instances will feel much more responsive with animations enabled.

## Known Issues

Affected Image    | Description | Issue
----------------- | ----------- | -----
Windows           | The installation of Chocolatey packages can randomly hang and will need to restart the Ansible provisioning. There are no clear solutions on how to avoid this problem other than using the Ansible timeout and retry mechanisms. | [#1](https://github.com/HQarroum/ultimate-aws-workspace/issues/1)
Linux             | On Linux (mainly Ubuntu), we have noticed that the first time a Packer built image is started, the Gnome Desktop Manager can be cut in half with half of the screen being black. The resolution is quite simple and involves restarting the Gnome Desktop Manager. We did not notice further problem beyond the initial start of the image. | [#3](https://github.com/HQarroum/ultimate-aws-workspace/issues/3)
