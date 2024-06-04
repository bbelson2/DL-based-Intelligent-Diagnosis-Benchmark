#!/bin/bash
DATA_ROOT='PU'

DROOT=~/vann/data
NORMALISE_TYPE='mean-std'
DATA_SUFFIXES=('' 'CWT' 'Slice' 'FFT' 'STFT')
DIMS=('1d' '2d' '2d' '1d' '2d')
for MODEL_NAME in 'cnn_' 'lenet_' 'alexnet_' 'resnet18_' 'BiLSTM'; do 
  for PROCESSING_TYPE in 'B_A' 'R_A' 'R_NA'; do
    for i in ${!DATA_SUFFIXES[*]}; do
      DATA_NAME=${DATA_ROOT}${DATA_SUFFIXES[i]}
      DIM=${DIMS[i]}
      python3 train.py --model_name ${MODEL_NAME}${DIM} --data_name ${DATA_NAME} --normalise_type ${NORMALISE_TYPE} --processing_type ${PROCESSING_TYPE} --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
    done
  done
done




# python train.py --model_name cnn_1d      --data_name PU      --normalise_type mean-std --processing_type B_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUCWT   --normalise_type mean-std --processing_type B_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUSlice --normalise_type mean-std --processing_type B_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_1d      --data_name PUFFT   --normalise_type mean-std --processing_type B_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUSTFT  --normalise_type mean-std --processing_type B_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_1d      --data_name PU      --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUCWT   --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUSlice --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_1d      --data_name PUFFT   --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUSTFT  --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_1d      --data_name PU      --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUCWT   --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUSlice --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_1d      --data_name PUFFT   --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUSTFT  --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_1d      --data_name PU      --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUCWT   --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUSlice --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_1d      --data_name PUFFT   --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name cnn_2d      --data_name PUSTFT  --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_1d    --data_name PU      --normalise_type mean-std --processing_type B_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUCWT   --normalise_type mean-std --processing_type B_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUSlice --normalise_type mean-std --processing_type B_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_1d    --data_name PUFFT   --normalise_type mean-std --processing_type B_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUSTFT  --normalise_type mean-std --processing_type B_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_1d    --data_name PU      --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUCWT   --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUSlice --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_1d    --data_name PUFFT   --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUSTFT  --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_1d    --data_name PU      --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUCWT   --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUSlice --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_1d    --data_name PUFFT   --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUSTFT  --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_1d    --data_name PU      --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUCWT   --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUSlice --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_1d    --data_name PUFFT   --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name lenet_2d    --data_name PUSTFT  --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_1d  --data_name PU      --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_2d  --data_name PUCWT   --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_2d  --data_name PUSlice --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_1d  --data_name PUFFT   --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_2d  --data_name PUSTFT  --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_1d  --data_name PU      --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_2d  --data_name PUCWT   --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_2d  --data_name PUSlice --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_1d  --data_name PUFFT   --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_2d  --data_name PUSTFT  --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_1d  --data_name PU      --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_2d  --data_name PUCWT   --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_2d  --data_name PUSlice --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_1d  --data_name PUFFT   --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name alexnet_2d  --data_name PUSTFT  --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_1d --data_name PU      --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_2d --data_name PUCWT   --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_2d --data_name PUSlice --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_1d --data_name PUFFT   --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_2d --data_name PUSTFT  --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_1d --data_name PU      --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_2d --data_name PUCWT   --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_2d --data_name PUSlice --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_1d --data_name PUFFT   --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_2d --data_name PUSTFT  --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_1d --data_name PU      --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_2d --data_name PUCWT   --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_2d --data_name PUSlice --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_1d --data_name PUFFT   --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name resnet18_2d --data_name PUSTFT  --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM1d    --data_name PU      --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM2d    --data_name PUCWT   --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM2d    --data_name PUSlice --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM1d    --data_name PUFFT   --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM2d    --data_name PUSTFT  --normalise_type mean-std --processing_type R_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM1d    --data_name PU      --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM2d    --data_name PUCWT   --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM2d    --data_name PUSlice --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM1d    --data_name PUFFT   --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM2d    --data_name PUSTFT  --normalise_type mean-std --processing_type R_NA --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM1d    --data_name PU      --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM2d    --data_name PUCWT   --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM2d    --data_name PUSlice --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM1d    --data_name PUFFT   --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
# python train.py --model_name BiLSTM2d    --data_name PUSTFT  --normalise_type mean-std --processing_type O_A  --max_epoch 100 --data_dir ${DROOT}/dlb/pu --batch_size 16
