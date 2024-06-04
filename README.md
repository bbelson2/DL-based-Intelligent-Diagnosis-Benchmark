
## DL-based-Intelligent-Diagnosis-Benchmark

Code release for **[Deep Learning Algorithms for Rotating Machinery Intelligent Diagnosis: An Open Source Benchmark Study](https://arxiv.org/abs/2003.03315)** by [Zhibin Zhao](https://Zhaozhibin.github.io/), Tianfu Li, and Jingyao Wu.

## Correction
* 2020.05.14, we modified the errors of the dataloaders related to XJTU dataset.

## Guide
This project just provides the baseline (lower bound) accuracies and a unified intelligent fault diagnosis library which retains an extended interface for everyone to load their own datasets and models by themselves to carry out new studies. Meanwhile, all the experiments are executed under Window 10 and Pytorch 1.1 through running on a computer with an Intel Core i7-9700K, GeForce RTX 2080Ti, and 16G RAM.

R_A: random split with data augmentation, R_NA: random split without data augmentation, O_A: order split with data augmentation

## Requirements
- Python 3.7
- Numpy 1.16.2
- Pandas 0.24.2
- Pickle
- tqdm 4.31.1
- sklearn 0.21.3
- Scipy 1.2.1
- opencv-python 4.1.0.25
- PyWavelets 1.0.2
- pytorch >= 1.1
- torchvision >= 0.40


## Datasets
- **[CWRU Bearing Dataset](https://csegroups.case.edu/bearingdatacenter/pages/download-data-file/)**
- **[MFPT Bearing Dataset](https://mfpt.org/fault-data-sets/)**
- **[PU Bearing Dataset](https://mb.uni-paderborn.de/kat/forschung/datacenter/bearing-datacenter/)**
- **[UoC Gear Fault Dataset](https://figshare.com/articles/Gear_Fault_Data/6127874/1)**
- **[XJTU-SY Bearing Dataset](http://biaowang.tech/xjtu-sy-bearing-datasets/)**
- **[SEU Gearbox Dataset](https://github.com/cathysiyu/Mechanical-datasets)**
- **[JNU Bearing Dataset](http://mad-net.org:8765/explore.html?t=0.5831516555847212.)**




## Pakages

This repository is organized as:
- [AE_Datasets](https://github.com/ZhaoZhibin/DL-based-Intelligent-Diagnosis-Benchmark/tree/master/AE_Datasets) contains the loader of different datasets for AE models.
- [CNN_Datasets](https://github.com/ZhaoZhibin/DL-based-Intelligent-Diagnosis-Benchmark/tree/master/CNN_Datasets) contains the loader of different datasets for MLP, CNN, and RNN models.
- [datasets](https://github.com/ZhaoZhibin/DL-based-Intelligent-Diagnosis-Benchmark/tree/master/datasets) contains the data augmentation methods and the Pytorch datasets for 1D and 2D signals.
- [models](https://github.com/ZhaoZhibin/DL-based-Intelligent-Diagnosis-Benchmark/tree/master/models) contains the models used in this project.
- [utils](https://github.com/ZhaoZhibin/DL-based-Intelligent-Diagnosis-Benchmark/tree/master/utils) contains the functions for realization of the training procedure.


## Usage
- download datasets
- use the train.py to test MLP, CNN, and MLP models

- for example, use the following commands to test MLP for SEU with mean-std normalization and data augmentation
- `python train.py --model_name MLP --data_name SEU --data_dir ./Data/Mechanical-datasets --normalise_type mean-std --processing_type O_A --checkpoint_dir ./Benchmark/Benchmark_Results/Order_split/SEU/MLP_mean-std_augmentation`

- use the train_ae.py to test AE models
- for example, use the following commands to test SAE for SEU with mean-std normalization and data augmentation
- `python train_ae.py --model_name Sae1d --data_name SEU --data_dir ./Data/Mechanical-datasets --normalise_type mean-std --processing_type O_A --checkpoint_dir ./Benchmark/Benchmark_Results/Order_split/SEU/Sae1d_mean-std_augmentation`
  


## Citation
Codes:
```
@misc{Zhao2020,
author = {Zhibin Zhao and Tianfu Li and Jingyao Wu and Chuang Sun and Shibin Wang and Ruqiang Yan and Xuefeng Chen},
title = {Deep Learning Algorithms for Rotating Machinery Intelligent Diagnosis},
year = {2020},
publisher = {GitHub},
journal = {GitHub repository},
howpublished = {\url{https://github.com/ZhaoZhibin/DL-based-Intelligent-Diagnosis-Benchmark}},
}
```
Paper:
```
@article{Zhao2020deep,
  title={Deep Learning Algorithms for Rotating Machinery Intelligent Diagnosis: An Open Source Benchmark Study},
  author={Zhibin Zhao and Tianfu Li and Jingyao Wu and Chuang Sun and Shibin Wang and Ruqiang Yan and Xuefeng Chen},
  journal={arXiv preprint arXiv:2003.03315},
  year={2020}
}
```
## Contact
- zhibinZhao1993@gmail.com
- litianfu@stu.xjtu.edu.cn

## This version
BB

## Setup

See https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_local

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pinsudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600wget https://developer.download.nvidia.com/compute/cuda/12.0.1/local_installers/cuda-repo-ubuntu2004-12-0-local_12.0.1-525.85.12-1_amd64.debsudo dpkg -i cuda-repo-ubuntu2004-12-0-local_12.0.1-525.85.12-1_amd64.debsudo cp /var/cuda-repo-ubuntu2004-12-0-local/cuda-*-keyring.gpg /usr/share/keyrings/sudo apt-get updatesudo apt-get -y install cuda

We have reached: https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#post-installation-actions