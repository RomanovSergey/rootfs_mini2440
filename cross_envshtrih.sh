 

ARCH=arm
CROSS_COMPILE=arm-none-linux-gnueabi-

#BASE=/home/abc/mini/work2
BASE=/home/wrk/device/rootfs_mini2440/rootfs_mini2440
PATH=$BASE/toolchain443/bin:$PATH
PREFIX=$BASE/build/rootfs

TARGET=arm-none-linux-gnueabi

CROSS_COMPILE=$TARGET-
CC="$TARGET-gcc"
AR="$TARGET-ar"
LD_LIBRARY_PATH="$BASE/build/rootfs/lib"
INSTALL_PATH="$BASE/build/rootfs"
INSTALL_MOD_DIR="$BASE/build/rootfs"
INCLUDES="-I $BASE/build/include"

CFLAGS="-O2 -march=armv4t -mtune=arm920t -s"
CXXFLAGS="${CFLAGS}"

