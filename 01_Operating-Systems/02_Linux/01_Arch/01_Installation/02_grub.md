# GRUB

## Preqrequisites

Before configuring grub, you must have your fstab configured, be chrooted in the environment, and have an initramfs created.

### Configure fstab

This is typicall pretty simple using the following command:

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

> This command would be generated from outside the chrooted environment. /mnt is the location that you have mounted your root file system.

### Chroot into environment

Use the following command to chroot into mounted root directory:

```bash
arch-chroot /mnt
```

> For reasons unknown and because of things people smarter than me do, you **must** use arch-chroot instead of the native chroot command.

### Have an initramfs created

This should typically be done automatically by the pacstrap command. If for some reason it wasn't, use the following command:

```bash
mkinitcpio -P
```

Sometimes this command will give you an error message about not finding a vmlinuz-linux file. If this is the case, reinstall the kernal in your chrooted environment:

```bash
pacman -S linux
```

> Again, because smart people say so, these steps are important and if things aren't working just follow them from the beginning.

## Installing GRUB

Grub should be installed using pacman alongside efibootmgr. Then you can run grub-install with the appropriate options.

```bash
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB # NOTE: --efi-directory should point to the directory that you have mounted your boot partition to. Check your /etc/fstab and make sure this lines up.
```

## Configuring GRUB

Now that GRUB is installed, you have to generate the config file which automatically scans for and adds your boot entries.

```bash
grub-mkconfig -o /boot/grub/grub.cfg #NOTE: Again, /boot should be the directory that you mounted your boot partition. Some people use /efi or /boot/efi.
```
