cd $GITHUB_WORKSPACE

# Env
sudo apt update && sudo apt -y dist-upgrade
sudo apt install -y gcc g++ python make texinfo texlive bc bison build-essential ccache curl flex g++-multilib gcc-multilib \
    git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev \
    libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev \
    unzip language-pack-zh-hans
# GCC Cross
wget "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz"
xz -d gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz
tar xf gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar
mv gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu .gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu
sudo chmod -R 777 ./*
# Env
export ARCH=arm64
export SUBARCH=arm64
export CROSS_COMPILE=/.gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/bin/binaarch64-none-linux-gnu-

# CMP
git config --global user.name "Mochen"
git config --global user.email "mochen20070702@gmail.com"
git clone https://github.com/freemarkw/android_kernel_xiaomi_msm8953.git -b Nosgoth ./Nosgoth
sudo chmod -R 777 ./*
cd Nosgoth
make clean
make mrproper
make O=out markw_defconfig