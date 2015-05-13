# Modify the following variable if you want to build
export PATH=$(pwd):/home/sandy/toolchains/aarch64-linux-android-4.9/bin:$PATH
export ARCH=arm
export SUBARCH=arm64
export CROSS_COMPILE=aarch64-linux-android-
make clean
make mrproper