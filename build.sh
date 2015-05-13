# Modify the following variable if you want to build
if [ -e ./arch/arm64/boot/Image ]; then
	rm ./arch/arm64/boot/Image
	rm ./arch/arm64/boot/Image.gz
	rm ./arch/arm64/boot/dt.img
fi
	export PATH=$(pwd):/home/kashif/toolchains/sabermod/bin:$PATH
	export ARCH=arm64
	export SUBARCH=arm64
	export CROSS_COMPILE=aarch64-linux-android-
	export KBUILD_BUILD_USER="kashif"
	export KBUILD_BUILD_HOST="Kbuildbox"
	make cyanogenmod_tomato-64_defconfig
	make -j8
	make dtbs

