resource "proxmox_vm_qemu" "master_node" {
  target_node = "poposki"
  name        = "Master-Node"

  vmid    = 100
  cores   = 2
  sockets = 1
  cpu     = "host"
  memory  = 1024


  disk {
    file    = "vm-100-disk-0"
    format  = "raw"
    size    = "25G"
    storage = "local-lvm"
    type    = "virtio"
  }

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  clone      = "ubuntu-init"
  os_type    = "cloud_init"
  ipconfig0  = var.master_ip_config
  nameserver = "1.1.1.1"
  ciuser     = "kiril"
  cipassword = var.vm_pass
  sshkeys    = var.public_key
}