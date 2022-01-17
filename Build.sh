cd $GITHUB_WORKSPACE
ls
# GCC Cross
wget "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz"
xz -d gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz
tar xf gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar
# Env
export ARCH=arm64
export SUBARCH=arm64
export CROSS_COMPILE=$GITHUB_WORKSPACE/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-

# CMP
git clone --depth=1 https://github.com/LineageOS/android_kernel_xiaomi_msm8953.git -b lineage-18.1
sudo chmod -R 777 ./*
cd $GITHUB_WORKSPACE/android_kernel_xiaomi_msm8953
make clean
make mrproper
make O=out msm8953-perf_defconfig
make -j4