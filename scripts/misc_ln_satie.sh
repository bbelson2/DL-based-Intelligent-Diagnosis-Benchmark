# Link to the code repo
cd ~
mkdir -p ~/vann
cd ~/vann/
ln -sf /mnt/c/repos/DL-based-Intelligent-Diagnosis-Benchmark ./code

# Link the /vann/data folders to the actual data
mkdir -p ~/vann/data
cd ~/vann/data/
ln -sf "/mnt/c/Users/Bruce/OneDrive - James Cook University/Projects/VA/data/CWRU/data" ./cwru
ln -sf /mnt/d/data/xjtu/XJTU-SY_Bearing_Datasets ./xjtu
ln -sf /mnt/d/data/pu ./pu
ln -sf "/mnt/c/Users/Bruce/OneDrive - James Cook University/Projects/VA/data/MFPT/MFPT-Fault-Data-Sets-20200227T131140Z-001/MFPT Fault Data Sets" ./mfpt
ln -sf "/mnt/c/Users/Bruce/OneDrive - James Cook University/Projects/VA/data/UOC/6127874" ./uoc
ln -sf "/mnt/c/Users/Bruce/OneDrive - James Cook University/Projects/VA/data/SEU/Mechanical-datasets-master/Mechanical-datasets-master/gearbox" ./seu

# Link the dlb layer to the /vann/data flders to get consistent naming across installations
mkdir -p dlb
cd dlb
#ln -sf /vann/data/cwru ./cwru NO - see cwru_ln.sh
ln -sf ~/vann/data/pu ./pu
ln -sf ~/vann/data/mfpt ./mfpt
ln -sf ~/vann/data/uoc ./uoc
ln -sf ~/vann/data/xjtu ./xjtu
ln -sf ~/vann/data/seu ./seu

# Finally link to the /tmp prefix
cd /tmp
ln -sf ~/vann/ ./vann

# Now see https://docs.nvidia.com/cuda/wsl-user-guide/index.html
# for how to install CUDA on WSL2
