resource "proxmox_vm_qemu" "proxy" {
  target_node = "poposki"
  memory      = 1024
  name        = "Proxy"
  numa        = false
  onboot      = true
  iso         = "local:iso/alpine-standard-3.16.2-x86_64.iso"
  ipconfig0   = var.ip_config
  qemu_os     = "other"

  disk {
    backup             = false
    cache              = "none"
    file               = "vm-100-disk-0"
    format             = "raw"
    iops               = 0
    iops_max           = 0
    iops_max_length    = 0
    iops_rd            = 0
    iops_rd_max        = 0
    iops_rd_max_length = 0
    iops_wr            = 0
    iops_wr_max        = 0
    iops_wr_max_length = 0
    iothread           = 0
    mbps               = 0
    mbps_rd            = 0
    mbps_rd_max        = 0
    mbps_wr            = 0
    mbps_wr_max        = 0
    replicate          = 0
    size               = "25G"
    slot               = 0
    ssd                = 0
    storage            = "local-lvm"
    type               = "scsi"
  }

  network {
    bridge    = "vmbr0"
    firewall  = true
    link_down = false
    model     = "virtio"
    mtu       = 0
    queues    = 0
    rate      = 0
    tag       = -1
  }
}