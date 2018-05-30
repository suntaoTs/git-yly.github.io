echo 'tar: start' > install.log
sudo tar xzvf cmake-2.8.8.tar.gz -C /usr/local/src/
echo 'tar: done' >> install.log

cd /usr/local/src/cmake-2.8.8  

echo 'bootstrap: start' >> install.log
sudo ./bootstrap
echo 'bootstrap: done' >> install.log

echo 'make -j: start' >> install.log
sudo make -j$(nproc)
echo 'make -j: done' >> install.log

echo 'make install: start' >> install.log
sudo make install
echo 'make install: done' >> install.log

echo 'ln cmake: start' >> install.log
sudo ln -sf /usr/local/bin/ctest /usr/bin/cmake  
echo 'ln cmake: done' >> install.log

echo 'ln ctest: start' >> install.log
sudo ln -sf /usr/local/bin/ctest /usr/bin/ctest
echo 'ln ctest: done' >> install.log

echo 'ln cpack: start' >> install.log
sudo ln -sf /usr/local/bin/ctest /usr/bin/cpack
echo 'ln cpack: done' >> install.log
