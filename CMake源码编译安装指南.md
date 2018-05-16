# CMake 安装
>## 下载解压源码包
>> ```shell
>> wget https://cmake.org/files/v2.8/cmake-2.8.8.tar.gz3
>> sudo tar xzvf cmake-2.8.8.tar.gz -C /usr/local/src/
>> ```
>## 编译安装
>> ```shell
>> cd /usr/local/src/cmake-2.8.8  
>> sudo ./bootstrap
>> sudo make -j$(nproc)
>> sudo make install
>> ```
>## 软链接设置
>> 如果以前装过cmake，可能会出现`/usr/bin`底下有cmake的二进制程序，导致版本不对，这时可以进行软链接设置。  
>> cmake 默认安装在`/usr/local/bin`底下，可以检查一下版本号再进行软链接设置：
>> ```shell
>> $ /usr/local/bin/cmake --version  
>> $ /usr/local/bin/ctest --version 
>> $ /usr/local/bin/cpack --version 
>> ```
>> 接下来进行软链接设置：
>> ```shell
>> sudo ln -sf /usr/local/bin/ctest /usr/bin/cmake  
>> sudo ln -sf /usr/local/bin/ctest /usr/bin/ctest
>> sudo ln -sf /usr/local/bin/ctest /usr/bin/cpack
>> ```
>> 检查一下软链接是否正常设置：
>> ```shell
>> $ cmake --version  
>> $ ctest --version 
>> $ cpack --version 
>> ```
>## 适配GCC
>>由于`cmake`是默认使用`cc`和`c++`来进行编译的，并不是`gcc`和`g++`。  
>>`cc`和`c++`其实是在`/usr/bin/`目录下的两个软链接，分别指向`gcc`和`g++`。  
>>在安装好`cmake`后，使用`cmake`前，应该先检查`cc`和`c++`是否指向了你想要使用的`gcc`和`g++`。这是因为一个系统里通常同时存在了多个版本的`GCC`，而你在许多情况下是要让`cmake`使用某个特定版本的`GCC`的。
