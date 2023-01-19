# install arch

>> initial steps

- loadkeys br-abnt2
- iwctl
  - station wlan0 connect "name"
- timedatectl set-ntp true

>> filesystem

- lsblk to check devices

- fdisk /dev/sd(x) 
- mkfs.fat -F32 /dev/sd(x)1 -> boot
- mkfs.ext4 /dev/sd(x)2 -> root

- mount /dev/sd(x)2 /mnt 

>> setup the packages

- pacstrap /mnt base linux linux-headers linux-firmware
- pacman -Syu
- pacman -S sudo nvim

>> fstab

- genfstab -U /mnt >> /mnt/etc/fstab

>> system settings

- arch-chroot /mnt

- ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
- hwclock --systohc
- nvim /etc/locale.gen
- locale-gen
- nvim /etc/locale.conf -> LANG=en_US.UTF-8
- echo [pc name] > /etc/hostname
- nvim /etc/hosts
  - 127.0.0.1     localhost
  - ::1           localhost
  - 127.0.0.1     [pc name]

>> user settings

- passwd (root)
- useradd -m [user]
- passwd [user]
- usermod -aG wheel,audio,video,optical,storage [user]
- EDITOR=nvim visudo -> uncomment %wheel ALL=(ALL) ALL

>> keyboard

- nvim /etc/vconsole.conf -> KEYMAP=br-abnt2

>> grub

- sudo pacman -S grub efibootmgr ( os-prober & mtools if dual-booting)

- mkdir /boot/efi/
- mount /dev/sd(x)1 /boot/efi
- grub-install --target=x86_64-efi --bootloader-id=grub
- grub-mkconfig -o /boot/grub/grub.cfg

>> network manager

- sudo pacman -S networkmanager-applet

- systemctl start NetworkManager.service
- systemctl enable NetworkManager

>> install whatever packages

>> exit & reboot

- exit
- umount /mnt 
- reboot
