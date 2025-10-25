START_DIR=$(pwd)

if [ -d "${ROOTDIR}/sw/arm/build/tmp/deploy/images/zynq_zybo" ]; then
    echo "Entering image deployment directory..."
    cd "${ROOTDIR}/sw/arm/build/tmp/deploy/images/zynq_zybo"
else
    echo "Error: Directory ${ROOTDIR}/sw/arm/build/tmp/deploy/images/zynq_zybo does not exist."
    exit 1
fi

if [ -b /dev/sdd ]; then
    echo "SD card detected at /dev/sdd — unmounting partitions..."
    sudo umount /dev/sdd1 /dev/sdd2
else
    echo "Error: No SD card detected at /dev/sdd."
    echo "Please insert the SD card and try again."
    exit 1
fi

sudo dd if=core-image-minimal-zynq_zybo.rootfs.wic of=/dev/sdd bs=1M status=progress
sync

cd "$START_DIR"

