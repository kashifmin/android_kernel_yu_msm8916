if [ -e ./arch/arm64/boot/Image ]; then
	echo "**** Successfully built kernel ****"
	
	echo "**** Creating dt.img ****"
	cd tools
	./dtbToolCM -2 -o /home/kashif/tomato/android_kernel_yu_msm8916/arch/arm64/boot/dt.img -s 2048 -p /home/kashif/tomato/android_kernel_yu_msm8916/scripts/dtc/ /home/kashif/tomato/android_kernel_yu_msm8916/arch/arm/boot/dts/
	cd ..
	if [ -e /home/kashif/tomato/android_kernel_yu_msm8916/arch/arm64/boot/dt.img ]; then
	echo "**** copying dtb ****"
	rm ./tools/mkboot/kash/dt.img
	cp ./arch/arm64/boot/dt.img ./tools/mkboot/kash/
	fi

	echo "**** Copying kernel to pack ****"
	if [ -e ./tools/mkboot/kash/zImage ]; then
	echo "**** removing existing ****"
	rm ./tools/mkboot/kash/zImage
	fi
	cp ./arch/arm64/boot/Image ./tools/mkboot/kash/zImage

	echo "**** Copying all built modules (.ko) to build_result/modules/ ****"
	mkdir -p ./build_result/
	for file in $(find ./ -name *.ko); do
	cp drivers/staging/prima/wlan.ko ./build_result
       /home/kashif/toolchains/aarch64-linux-android-4.9/bin/aarch64-linux-android-strip --strip-unneeded build_result/wlan.ko
	done
fi