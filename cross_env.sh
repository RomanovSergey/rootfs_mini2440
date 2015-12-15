
export ARCH=arm
export CROSS_COMPILE=arm-none-linux-gnueabi-

BASE=/home/abc/mini/work2
export PATH=/home/abc/mini/work/opt/FriendlyARM/toolschain/4.4.3/bin:$PATH
export PREFIX=$BASE/build/rootfs

export ARCH=arm
export TARGET=arm-none-linux-gnueabi

export CROSS_COMPILE=$TARGET-
export CC="$TARGET-gcc"
export AR="$TARGET-ar"
export LD_LIBRARY_PATH="$BASE/build/rootfs/lib"
export INSTALL_PATH="$BASE/build/rootfs"
export INSTALL_MOD_DIR="$BASE/build/rootfs"
export INCLUDES="-I $BASE/build/include"

export CFLAGS="-O2 -march=armv4t -mtune=arm920t -s"
export CXXFLAGS="${CFLAGS}"

