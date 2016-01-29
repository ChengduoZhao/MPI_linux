echo "Downloading mpich-3.2.tar.gz"
yum install gcc-gfortran
wget http://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz
tar -zxvf mpich-3.2.tar.gz
cd mpich-3.2
./configure --prefix=/usr/local/mpich --enable-f90  --enable-cxx --enable-threads=multiple --enable-sharedlibs=gcc --with-mpe --enable-romio --enable-fc
make -j8
make install
"
sudo echo "export PATH=/usr/local/mpich/bin:${PATH}  
export LD_LIBRARY_PATH=/usr/local/mpich/lib:${LD_LIBRARY_PATH}  
export MANPATH=/usr/local/mpich/share/man:${MANPATH}" >> profile.txt
sudo cat profile.txt >> /etc/profile
sudo rm profile.txt
sudo source
"
sudo sh -c 'echo "/usr/local/mpich/lib" > /etc/ld.so.conf.d/mpi.conf'
sudo ldconfig
