#!/bin/bash
qemu-img convert -f vmdk /mnt/pve/vhdx-source.vhdx -O qcow2 /mnt/pve/qcow-target.qcow2