resource "proxmox_vm_qemu" "master_node" {
  target_node = "poposki"
  name        = "Master-Node"

  vmid    = 100
  cores   = 2
  sockets = 1
  cpu     = "host"
  memory  = 2048


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

resource "proxmox_vm_qemu" "worker1_node" {
  name        = "Worker1-Node"
  target_node = "poposki"
  vmid        = 101

  memory = 2048
  cores  = 2
  cpu    = "host"

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

  clone      = "ubuntu-init"
  os_type    = "cloud_init"
  ipconfig0  = var.node1_ip_config
  nameserver = "1.1.1.1"
  ciuser     = "kiril"
  cipassword = var.vm_pass
  sshkeys    = var.public_key
}

resource "proxmox_vm_qemu" "worker2_node" {
  name        = "Worker2-Node"
  target_node = "poposki"
  vmid        = 102

  memory = 2048
  cores  = 2
  cpu    = "host"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    type    = "virtio"
    storage = "local-lvm"
    size    = "25G"
    format  = "raw"
    file    = "vm-102-disk-0"
  }

  clone      = "ubuntu-init"
  os_type    = "cloud_init"
  ipconfig0  = var.node2_ip_config
  nameserver = "1.1.1.1"
  ciuser     = "kiril"
  cipassword = var.vm_pass
  sshkeys    = var.public_key
}