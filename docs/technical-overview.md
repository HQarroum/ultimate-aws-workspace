# Technical Overview

This section provides some technical documentation about components built into the produced images, along with additional information such as the known issues.

## GPU Integration

AWS provides instances powered by both NVIDIA and AMD graphics card. This implementation partially covers the different combination of instance types and GPU vendors. Below is a matrix documenting what is currently supported by the Ansible template provided in this repository.

Operating System | NVIDIA T4 (G4 Instances) | NVIDIA A10G (G5 Instances) | NVIDIA L40S (G6e Instances) | AMD v520 | Dummy Driver (no GPU)
---------------- | ------------------------ | -------------------------- | ------------------- | -------- | ---------------------
Ubuntu 22.04/24.04     |           ✅             |             ✅             |    ✅         | ⚠️*    |          ✅
RedHat 9         |           ✅             |             ✅             |    ❌*** | ❌**  |          ✅
Windows          |           ✅             |             ✅             | ✅ |     ✅    |          ✅

> \* On Ubuntu, OpenCL is not enabled on the installed AMD drivers, only the OpenGL support is installed because of difficulties in building the driver.
> ** On RedHat 9, the AMD driver does not seem compatible with the system. More investigations are required to find the root cause of the problem.
> *** On RedHat 9, the NVIDIA L40S driver is not available in the official repositories, and the installation of the driver is not supported by the Ansible playbook.

Non-GPU instances will generally feel more laggy, and animations will tend to be disabled by the desktop manager, while GPU instances will feel much more responsive with animations enabled.
