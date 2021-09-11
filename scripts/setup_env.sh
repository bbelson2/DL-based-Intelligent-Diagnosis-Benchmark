conda create --name pytorch python=3.7
conda activate pytorch
conda install -c anaconda numpy pandas 
conda install -c conda-forge tqdm
conda install -c anaconda scikit-learn scipy
conda install -c conda-forge opencv pywavelets
conda install -c pytorch pytorch torchvision # if nvidia gpu is present
# conda install pytorch torchvision cpuonly -c pytorch # if no nvidia gpu
pip install thop
