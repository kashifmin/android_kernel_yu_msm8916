if [ -e ./tools/mkboot/boot.img ]; then
	echo "**** boot.img available ****"
	rm ../kernelout/boot.img
	rm ../kernelout/system/lib/modules/wlan.ko
	rm ../kernelout/KKernel_1.0.zip
	echo "**** Copying it to zip ****"
	cp ./tools/mkboot/boot.img ../kernelout/
	cp ./build_result/wlan.ko ../kernelout/system/lib/modules/wlan.ko
	cd ../kernelout
	zip -r KKernel_1.0.zip *
	if [ -e ../KKernel_1.0.zip ]; then
	echo "**** Zip finished and ready ****"
	fi
fi