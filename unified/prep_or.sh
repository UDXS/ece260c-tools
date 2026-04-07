source /opt/miniconda3/bin/activate
conda activate base

cd /
git clone https://github.com/The-OpenROAD-Project/OpenROAD.git 
cd OpenROAD
git submodule update --init --recursive
git reset --hard --recurse-submodules 52ff2a5ea5814dc671c1cf7c4b950f840b6a4e88 

./etc/DependencyInstaller.sh -all

./etc/Build.sh -threads=16
cd build
make -j install

cd /
rm -rf OpenROAD