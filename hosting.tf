resource "proxmox_vm_qemu" "hosting" {
  name        = "hosting"
  target_node = "poposki"
  vmid        = 111
  desc        = "This is where the web applications are"

  memory      = 1024
  cores       = 2
  cpu = "host"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    type    = "virtio"
    storage = "local-lvm"
    size    = "25G"
    format  = "raw"
    file    = "vm-101-disk-0"
  }

  clone = "ubuntu-init"
  os_type = "cloud_init"
  ipconfig0   = var.hosting_ip_config
  nameserver = "1.1.1.1"
  ciuser = "kiril"
  cipassword = var.vm_pass
  sshkeys = var.public_key
}