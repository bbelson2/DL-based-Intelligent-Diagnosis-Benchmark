# python train_ae.py --model_name Sae1d --data_name CWRU   --normalise_type mean-std --processing_type R_A --max_epoch 10 --middle_epoch 5 --data_dir /vann/data/dlb/cwru --batch_size 16
# python train_ae.py --model_name Sae2d --data_name CWRUCWT   --normalise_type mean-std --processing_type R_A --max_epoch 10 --middle_epoch 5 --data_dir /vann/data/dlb/cwru --batch_size 16
# python train_ae.py --model_name Sae2d --data_name CWRUSlice   --normalise_type mean-std --processing_type R_A --max_epoch 10 --middle_epoch 5 --data_dir /vann/data/dlb/cwru --batch_size 16
# python train_ae.py --model_name Sae1d --data_name CWRUFFT   --normalise_type mean-std --processing_type R_A --max_epoch 10 --middle_epoch 5 --data_dir /vann/data/dlb/cwru --batch_size 16
# python train_ae.py --model_name Sae2d --data_name CWRUSTFT   --normalise_type mean-std --processing_type R_A --max_epoch 10 --middle_epoch 5 --data_dir /vann/data/dlb/cwru --batch_size 16

python train.py --model_name cnn_1d --data_name CWRU        --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/cwru --batch_size 16
python train.py --model_name cnn_1d --data_name CWRU        --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/cwru --batch_size 16
python train.py --model_name cnn_1d --data_name CWRU        --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/cwru --batch_size 16
python train.py --model_name cnn_2d --data_name CWRUCWT     --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/cwru --batch_size 16
python train.py --model_name cnn_2d --data_name CWRUSlice   --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/cwru --batch_size 16
python train.py --model_name cnn_1d --data_name CWRUFFT     --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/cwru --batch_size 16
python train.py --model_name cnn_2d --data_name CWRUSTFT    --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/cwru --batch_size 16

# python train.py --model_name cnn_1d --data_name SEU      --normalise_type mean-std --processing_type R_A --max_epoch 100 --data_dir /vann/data/dlb/seu --batch_size 16 
# python train.py --model_name cnn_1d --data_name XJTU      --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/xjtu --batch_size 16 
# python train.py --model_name cnn_1d --data_name UOC      --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/uoc --batch_size 16 
# python train.py --model_name cnn_1d --data_name MFPT      --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/mfpt --batch_size 16
# python train.py --model_name cnn_2d --data_name CWRUCWT   --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/cwru --batch_size 16
# python train.py --model_name cnn_2d --data_name CWRUSlice --normalise_type mean-std --processing_type R_A --max_epoch 10 --data_dir /vann/data/dlb/cwru --batch_size 16

# cd /vann/data/xjtu
# unrar x XJTU-SY_Bearing_Datasets.part01.rar 
# unrar x XJTU-SY_Bearing_Datasets.part02.rar 
# unrar x XJTU-SY_Bearing_Datasets.part03.rar 
# unrar x XJTU-SY_Bearing_Datasets.part04.rar 
# unrar x XJTU-SY_Bearing_Datasets.part05.rar 
# unrar x XJTU-SY_Bearing_Datasets.part06.rar 
