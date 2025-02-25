
source "cross" "ubuntu" {
  file_checksum_type    = "sha256"
  file_checksum_url     = "https://github.com/parallella/parabuntu/releases/download/parabuntu-2016.11.1/sha256sum.txt"
  file_target_extension = "gz"
  file_unarchive_cmd    = ["gunzip", "$ARCHIVE_PATH"]
  file_urls             = ["https://github.com/parallella/parabuntu/releases/download/parabuntu-2016.11.1/parabuntu-2016.11.1-headless-z7020.img.gz"]
  image_build_method    = "reuse"
  image_chroot_env      = ["PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"]
  image_partitions {
    filesystem   = "fat"
    mountpoint   = "/boot"
    name         = "boot"
    size         = "100M"
    start_sector = "2048"
    type         = "b"
  }
  image_partitions {
    filesystem   = "ext4"
    mountpoint   = "/"
    name         = "root"
    size         = "0"
    start_sector = "206848"
    type         = "83"
  }
  image_path                   = "parallela.img"
  image_size                   = "4G"
  image_type                   = "dos"
  qemu_binary_destination_path = "/usr/bin/qemu-arm-static"
  qemu_binary_source_path      = "/usr/bin/qemu-arm-static"
}

build {
  sources = ["source.cross.ubuntu"]

  provisioner "shell" {
    inline = [
      "touch /tmp/test"
    ]
  }

}
