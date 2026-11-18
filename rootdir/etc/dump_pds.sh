#!/system/bin/sh

DUMP=$(getprop ro.vendor.pds_dump)
[ -z "$DUMP" ] && DUMP=/metadata/pds-dump.img

if [ ! -f $DUMP ]; then
    # Make a copy of pds (in /metadata, or where the device says)
    cp /dev/block/platform/msm_sdcc.1/by-name/pds $DUMP-temp
    # Prevent init from using a partially created file
    mv $DUMP-temp $DUMP
fi
