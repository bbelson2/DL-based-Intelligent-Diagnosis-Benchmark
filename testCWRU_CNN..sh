python train.py --model_name cnn_1d --data_name CWRU      --normlizetype mean-std --processing_type R_A --max_epoch 100 --data_dir /vann/data/zhao/cwru --batch_size 16
python train.py --model_name cnn_2d --data_name CWRUCWT   --normlizetype mean-std --processing_type R_A --max_epoch 100 --data_dir /vann/data/zhao/cwru --batch_size 16
python train.py --model_name cnn_2d --data_name CWRUSlice --normlizetype mean-std --processing_type R_A --max_epoch 100 --data_dir /vann/data/zhao/cwru --batch_size 16
