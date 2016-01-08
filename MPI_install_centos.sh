echo "Downloading mpich-3.2.tar.gz"
wget http://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz
tar -zxvf mpich-3.2.tar.gz
cd mpich-3.2
./configure --enable-fc --enable-cxx --enable-romio --enable-threads=multiple --prefix=/usr/local/mpich
make -j8
make install

sudo echo "export PATH=/usr/local/mpich/bin:${PATH}  
export LD_LIBRARY_PATH=/usr/local/mpich/lib:${LD_LIBRARY_PATH}  
export MANPATH=/usr/local/mpich/share/man:${MANPATH}" >> profile.txt

sudo cat profile.txt >> /etc/profile
sudo source

sudo sh -c 'echo "/usr/local/mpich/lib" > /etc/ld.so.conf.d/mpi.conf'
sudo ldconfig