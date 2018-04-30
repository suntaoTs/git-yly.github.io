# 下载gcc4.9.4

在安装gcc当然要先拿到gcc的安装文件。在这里我们直接通过官方<br>
> http://gcc.gnu.org/<br>
> http://ftp.gnu.org/gnu/gcc/

下载gcc-4.9.4.tar.bz2(86 MB)。当然，你也可以下载gcc-4.9.4.tar.gz(110 MB)，不过该压缩文件要大出不少。<br>

### 安装前的准备工作
想要安装gcc 4.8及以上版本，你需要先安装C标准库和头文件，以及旧版本的c++编译器。如果你的计算机中没有这些，请执行以下命令(当然你也可以使用apt-get等其它方式进行安装，如果已经安装则无需再次安装)：<br>
sudo yum install -y glibc-static libstdc++-static
sudo yum install -y gcc gcc-c++ kernel-devel

# 解压缩

`sudo tar jxf gcc-4.9.4.tar.bz2 -C /usr/local/src`

- 运行download_prerequisites脚本，这个脚本会自动帮你下载所需要的依赖文件和库

```shell
#转到gcc源程序根目录
cd /usr/local/src/gcc-4.9.4
#下载一些必备的依赖程序
sudo ./contrib/download_prerequisites
```

# 建立输出目录，将所有的中间文件都放到该目录

```shell
sudo mkdir /usr/local/build/gcc-4.9.4
```

# 开始安装GCC
# 编译配置

```shell
cd /usr/local/build/gcc-4.9.4
# 我们通过选项 --prefix= 指定了GCC的安装目录，以防找不到
sudo /usr/local/src/gcc-4.9.4/configure --prefix=/usr/local/gcc-4.9.4/ --enable-checking=release --enable-languages=c,c++ --disable-multilib
```
# 开始编译

```shell
# `$(nproc)`返回系统的线程数量，注意，-j的后面没有空格
$ sudo make -j$(nproc)
$ sudo make install
```
# 更改环境变量
`vim ~/.bash_profile`
将以下几行添加进 .bash_profile 中：

```shell
export PATH=/usr/local/gcc-4.9.4/bin:$PATH
export LD_LIBRARY_PATH=/lib:/lib64:/usr/local/lib:/usr/local/lib64/:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=/usr/include:/usr/local/include/:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/usr/include:/usr/local/include/:$CPLUS_INCLUDE_PATH
```

# 更改软链接
## 常规软链接更改
更新C/C++库的软链接、GCC和G++的二进制软链接、还有头文件的软链接。  
```shell
# 添加 头文件 软链接
sudo ln -sf /usr/local/gcc-4.9.4/include/c++/4.9.4 /usr/include/c++/4.9.4
sudo ln -sf /usr/local/gcc-4.9.4/include/c++/4.9.4 /usr/local/include/c++/4.9.4

# 添加 库文件 软链接
sudo ln -sf /usr/local/gcc-4.9.4/lib64/libstdc++.so.6.0.20 /lib64/libstdc++.so.6
sudo ln -sf /lib64/libstdc++.so.6 /lib64/libstdc++.so

sudo ln -sf /usr/local/gcc-4.9.4/lib64/libstdc++.so.6.0.20 /usr/lib64/libstdc++.so.6
sudo ln -sf /usr/lib64/libstdc++.so.6 /usr/lib64/libstdc++.so

sudo ln -sf /usr/local/gcc-4.9.4/lib64/libstdc++.so.6.0.20 /usr/local/lib64/libstdc++.so.6
sudo ln -sf /usr/local/lib64/libstdc++.so.6 /usr/local/lib64/libstdc++.so

# 添加 二进制文件 软链接
sudo ln -sf /usr/local/gcc-4.9.4/bin/gcc /bin/gcc  
sudo ln -sf /usr/local/gcc-4.9.4/bin/g++ /bin/g++
sudo ln -sf /usr/local/gcc-4.9.4/bin/gcc /usr/bin/gcc  
sudo ln -sf /usr/local/gcc-4.9.4/bin/g++ /usr/bin/g++
sudo ln -sf /usr/local/gcc-4.9.4/bin/gcc /usr/local/bin/gcc  
sudo ln -sf /usr/local/gcc-4.9.4/bin/g++ /usr/local/bin/g++
```
最后不要忘了`$ ldconfig`  

## `cmake`软链接更改
如果希望`cmake`也使用新版本的`GCC`和`G++`的话，还要再添加以下的软链接：  
```Shell
sudo ln -sf /usr/local/gcc-4.9.4/bin/gcc /usr/bin/cc
sudo ln -sf /usr/local/gcc-4.9.4/bin/g++ /usr/bin/c++
```