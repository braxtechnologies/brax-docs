---
title: How to build from source
---

This page will outline how to build Ubuntu Touch images for BraX3 once the device is fully integrated into the Ubuntu Touch build infrastructure. For now, use it as a high level orientation that points you to the official porting and build documentation.

## Why Ubuntu Touch builds look different

Ubuntu Touch is built as a complete system image on top of an Ubuntu base, using the UBports build infrastructure. Device support is usually implemented through device specific repositories that describe the kernel, hardware adaptation and packaging.

## Requirements (typical)

- A recent 64 bit Ubuntu or Debian based Linux distribution for building.
- Standard development tools (Git, Python, build essentials and dependencies described in the Ubuntu Touch docs).
- Sufficient disk space and memory for syncing and building multiple gigabytes of source code.

Refer to the official documentation for the most accurate and current list:

- Ubuntu Touch porting documentation: https://docs.ubports.com/en/latest/porting/introduction.html

## High level steps

1. **Study existing ports** for hardware platforms similar to BraX3 to understand how kernels and hardware adaptation layers are structured.
2. **Set up the build environment** following the UBports documentation. This typically involves installing specific packages and using provided helper scripts or containers.
3. **Sync the required repositories**, including the Ubuntu Touch core layers and the device specific projects for BraX3 once they are published.
4. **Configure the build** for the BraX3 target and run the appropriate build commands to generate system images.
5. **Flash and test** the built images on a BraX3 device, iterating on device specific changes until the port is stable.

## Current status

The BraX3 Ubuntu Touch port is an ongoing effort. As the work matures and official repositories and build instructions are published, this page should be updated to include:

- Exact repository URLs for BraX3 related projects.
- Verified build commands and configuration options.
- Known issues and troubleshooting tips specific to this device.