# gentoo-ebuilds
Custom Gentoo ebuild scripts that cover some missing/outdated ebuilds in official repo.

#### Warning: the ebuilds in this repo are not guaranteed to be stable



### Gentoo Installation 


#### raid settings
##### format disk
```
From https://gist.github.com/jirutka/990d25662e729669b3ce
```
##### fstab
```
UUID="05DB-8554" /boot vfat defaults 0 2
LABEL="btrfsvol"  / btrfs defaults,subvol=root,noatime,compress=zstd,autodefrag 0 0
/dev/sda2 none swap sw 0 0
/dev/sdb2 none swap sw 0 0
```

##### btrfs degraded
`sys-fs/btrfs-progs` package emerge
add a boot parameter `rd.timeout=30` to grub.
and There you can manually mount degraded:
`mount -o subvol=root,degraded /dev/sdXY /sysroot; exit`

##### dracut 
```
# PUT YOUR CONFIG IN separate files
# in /etc/dracut.conf.d named "<name>.conf"
# SEE man dracut.conf(5) for options
add_dracutmodules+="btrfs mdraid"
add_drivers+="raid1"
mdadmconf="yes"
```

##### grub
Assuming you have a UEFI system and efi parition mounted on `/boot`, you need to install grub for x86_64-efi:
```
grub-install --target=x86_64-efi --efi-directory=/boot --removable
```
/etc/default/grub
```
GRUB_DISTRIBUTOR="Gentoo"
GRUB_TIMEOUT=5
GRUB_TIMEOUT_STYLE=menu
GRUB_CMDLINE_LINUX="rd.timeout=30"
```
