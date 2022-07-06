#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/soc/11230000.mmc/by-name/recovery$(getprop ro.boot.slot_suffix):41943040:96044abba4b00104666fb29e2a9a8e62dec8da5a; then
  applypatch --bonus /vendor/etc/recovery-resource.dat \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/soc/11230000.mmc/by-name/boot$(getprop ro.boot.slot_suffix):33554432:7c6d60f39daf177a7ff23b6b6b1ea94f44db0821 \
          --target EMMC:/dev/block/platform/soc/11230000.mmc/by-name/recovery$(getprop ro.boot.slot_suffix):41943040:96044abba4b00104666fb29e2a9a8e62dec8da5a && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
