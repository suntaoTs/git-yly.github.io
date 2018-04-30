# OpenCV-2.4.13 编译安装
>## 检查环境和环境变量
>- 检查是否有CUDA环境
>- 执行以下下命令，设置环境变量（按需设置即可）：
>> ```shell
>> export PATH=/usr/local/cuda/bin:$PATH
>> export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/include/lib:$LD_LIBRARY_PATH
>> export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
>> ```
>## 下载OpenCV-2.4.13.zip，并解压安装包
>> ```shell
>> wget https://github.com/opencv/opencv/archive/2.4.13.zip
>> unzip OpenCV-2.4.13.zip
>> ```
>## 建立编译目录
>>```shell
>> cd opencv-2.4.13
>> mkdir build
>> cd build
>>```
>## 编译安装
>>```shell
>> sudo ln -s /usr/lib64/libnvcuvid.so /usr/lib/libnvcuvid.so
>> cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_FFMPEG=ON -D WITH_V4L=ON -D WITH_NVCUVID=ON -D WITH_CUDA=ON -D BUILD_EXAMPLES=ON -D CUDA_ARCH_BIN="6.1,5.2" -D BUILD_TIFF=ON ..
>> make -j$(nproc)
>> sudo make install
>> sudo ldconfig
>> ```