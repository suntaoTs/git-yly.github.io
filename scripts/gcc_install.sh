sudo tar -xzvf gcc-4.9.4.tar.gz -C /usr/local/src
cd /usr/local/src/gcc-4.9.4

sudo ./contrib/download_prerequisites

sudo mkdir build
cd build

sudo ../configure --prefix=/usr/local/gcc-4.9.4/ --enable-checking=release --enable-languages=c,c++ --disable-multilib

sudo make -j $(nproc)
sudo make install

sudo ln -sf /usr/local/gcc-4.9.4/include/c++/4.9.4 /usr/include/c++/4.9.4
sudo ln -sf /usr/local/gcc-4.9.4/include/c++/4.9.4 /usr/local/include/c++/4.9.4

sudo ln -sf /usr/local/gcc-4.9.4/lib64/libstdc++.so.6.0.20 /lib64/libstdc++.so.6
sudo ln -sf /lib64/libstdc++.so.6 /lib64/libstdc++.so

sudo ln -sf /usr/local/gcc-4.9.4/lib64/libstdc++.so.6.0.20 /usr/lib64/libstdc++.so.6
sudo ln -sf /usr/lib64/libstdc++.so.6 /usr/lib64/libstdc++.so

sudo ln -sf /usr/local/gcc-4.9.4/lib64/libstdc++.so.6.0.20 /usr/local/lib64/libstdc++.so.6
sudo ln -sf /usr/local/lib64/libstdc++.so.6 /usr/local/lib64/libstdc++.so

sudo ln -sf /usr/local/gcc-4.9.4/bin/gcc /bin/gcc  
sudo ln -sf /usr/local/gcc-4.9.4/bin/g++ /bin/g++
sudo ln -sf /usr/local/gcc-4.9.4/bin/gcc /usr/bin/gcc  
sudo ln -sf /usr/local/gcc-4.9.4/bin/g++ /usr/bin/g++
sudo ln -sf /usr/local/gcc-4.9.4/bin/gcc /usr/local/bin/gcc  
sudo ln -sf /usr/local/gcc-4.9.4/bin/g++ /usr/local/bin/g++

sudo ln -sf /usr/local/gcc-4.9.4/bin/gcc /usr/bin/cc
sudo ln -sf /usr/local/gcc-4.9.4/bin/g++ /usr/bin/c++