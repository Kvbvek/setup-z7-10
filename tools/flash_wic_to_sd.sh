START_DIR=$(pwd)

if [ -d "${ROOTDIR}/sw/arm/build/tmp/deploy/images/zybo-agh" ]; then
    echo "Entering image deployment directory..."
    cd "${ROOTDIR}/sw/arm/build/tmp/deploy/images/zybo-agh"
    if [ -b /dev/sdd ]; then
        echo "SD card detected at /dev/sdd — unmounting partitions..."
        sudo umount /dev/sdd1 /dev/sdd2
        sudo dd if=zybo-agh-image-minimal-zybo-agh.rootfs.wic of=/dev/sdd bs=1M status=progress
        sync
    else
        echo "Error: No SD card detected at /dev/sdd."
        echo "Please insert the SD card and try again."
    fi

else
    echo "Error: Directory ${ROOTDIR}/sw/arm/build/tmp/deploy/images/zybo-agh does not exist."
fi


cd "$START_DIR"

