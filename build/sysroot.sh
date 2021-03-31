#!/bin/bash
sudo apt-get install -y debootstrap
mkdir sysroot-no-stl
sudo debootstrap bionic ./sysroot-no-stl
sudo cp /etc/apt/sources.list sysroot-no-stl/etc/apt/sources.list
sudo chroot sysroot-no-stl apt-get update
sudo chroot sysroot-no-stl apt-get install -y libstdc++-9-dev
sudo mv ./sysroot-no-stl/usr/include/c++/9/deque ./sysroot-no-stl/usr/include/c++/9/deque_forbidden
sudo mv ./sysroot-no-stl/usr/include/c++/9/list ./sysroot-no-stl/usr/include/c++/9/list_forbidden
sudo mv ./sysroot-no-stl/usr/include/c++/9/algorithm ./sysroot-no-stl/usr/include/c++/9/algorithm_forbidden
sudo tar -czvf sysroot.tgz ./sysroot-no-stl
sudo rm -r sysroot-no-stl
