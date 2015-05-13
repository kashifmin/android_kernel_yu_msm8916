if [ -e ./tools/mkboot/kash/zImage ]; then
	echo "**** Kernel available ****"

	if [ -e ./tools/mkboot/boot.img ]; then
	echo "**** removing existing ****"
	rm tools/mkboot/boot.img
	fi
	
	echo "**** Packing ****"
	cd tools/mkboot
	./mkboot kash boot.img
	cd ..
fi