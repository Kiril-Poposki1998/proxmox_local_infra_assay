resource "proxmox_vm_qemu" "hosting" {
  name        = "hosting"
  target_node = "poposki"
  vmid        = 101
  desc        = "This is where the web applications are"
  oncreate    = true
  iso         = "local:iso/alpine-standard-3.16.2-x86_64.iso"
  memory      = 1024
  cores       = 2
  qemu_os     = "other"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "25G"
    format  = "raw"
    file    = "vm-101-disk-0"
  }
}