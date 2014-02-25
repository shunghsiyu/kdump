#!/bin/bash
# module-setup.sh for kdump dracut module

. /lib/kdump/setup-kdump.functions

check() {
    return 255
}

install() {
    inst_hook pre-pivot 1 /lib/mkinitrd/scripts/boot-kdump.sh
    inst /etc/sysconfig/kdump
    inst_multiple makedumpfile makedumpfile-R.pl kdumptool

    kdump_import_targets
    kdump_setup_files "$initdir" sysroot "${!host_fs_types[*]}" "$KDUMP_mntnum"
}
