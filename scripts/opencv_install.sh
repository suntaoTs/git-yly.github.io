#!/bin/bash
########################################################
# Copyright (C), Sensetime Tech. Co., Ltd.
# create date: 2017-07-12
# creator    : sheyifu@sensetime.com
# description: sensetime base packets installer script
# modify log :
########################################################

# install OpenCV
if [ ! -f OpenCV-2.4.13.zip ]; then 
echo "### fail to find opencv-2.4.13.zip !"
exit 1
fi
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/include/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

unzip OpenCV-2.4.13.zip
cd opencv-2.4.13
mkdir build
cd build
# TODO if centos then
# TODO if ubuntu then
#sudo ln -s /usr/lib64/libnvcuvid.so /usr/lib/libnvcuvid.so
echo 'cmake: start' > install.log
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_FFMPEG=ON -D WITH_V4L=ON -D WITH_NVCUVID=ON -D WITH_CUDA=ON -D BUILD_EXAMPLES=ON -D CUDA_ARCH_BIN="6.1,5.2" -D BUILD_TIFF=ON ..
echo 'cmake: start' >> install.log

echo 'make -j: start' >> install.log
make -j $(nproc)
echo 'make -j: done' >> install.log

echo 'make install: start' >> install.log
sudo make install
echo 'make install: done' >> install.log

echo 'ldconfig: start' >> install.log
sudo ldconfig
echo 'ldconfig: done' >> install.log

cd .. # leave build
cd .. # leave opencv-2.4.13
echo "Install OpenCV complete!"
