echo
echo "Setup"
echo
export LOCALVERSION="-Pop-KSU"
rm -rf out
mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
make O=out clean
make O=out mrproper

echo
echo "Issue Build Commands"
echo
export CROSS_COMPILE=/home/zetlink/Documentos/AndroidDevelopment/Bullhead-KSU/toolchain/gcc10/bin/aarch64-none-linux-gnu-

echo
echo "Set DEFCONFIG"
echo 
make O=out shadow_defconfig

echo
echo "Build The Good Stuff"
echo 
make O=out -j$(nproc --all)

rm ./AnyKernel3/Image.gz-dtb
cp ./out/arch/arm64/boot/Image.gz-dtb ./AnyKernel3
cd AnyKernel3
rm ./Pop_kernel-bullhead-KSU-O-rx-x.zip
zip -r9 Pop_kernel-bullhead-KSU-O-rx-x.zip * -x .git README.md *placeholder
