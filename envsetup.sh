export LFS=/mnt/lfs
export LFS_TGT=$(uname -m)-lfs-linux-gnu

if [ $(id -u) -eq 0 ]; then
    sudo mkdir -pv $LFS
    sudo mount --bind rootfs $LFS
else
    echo "Run the following:"
    echo "sudo mkdir -pv $LFS"
    echo "sudo mount --bind rootfs $LFS"
fi

# Prepare dirs
mkdir -pv $LFS/sources
mkdir -pv $LFS/tools

if [ "$(readlink -f /tools)" != "$LFS/tools" ]; then
    if [ $(id -u) -eq 0 ]; then
        sudo ln -sv $LFS/tools /
    else
        echo "Run the following:"
        echo "sudo ln -sv $LFS/tools /"
    fi
fi
export PATH=/tools/bin:$PATH
