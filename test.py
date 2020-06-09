#!/usr/bin/python
# -*- coding:utf-8 -*-

import argparse
import os
from datetime import datetime
from utils.logger import setlogger
import logging
from utils.test_utils import test_utils


args = None

def parse_args():
    parser = argparse.ArgumentParser(description='Test')

    # basic parameters
    parser.add_argument('--model_name', type=str, default='Inception2d', help='the name of the model')
    parser.add_argument('--data_name', type=str, default='CWRUSlice', help='the name of the data')
    parser.add_argument('--data_dir', type=str, default= "/vann/data", help='the directory of the data')
    parser.add_argument('--normalise_type', type=str, choices=['0-1', '1-1', 'mean-std'], default='0-1', help='data normalization methods')
    parser.add_argument('--processing_type', type=str, choices=['R_A', 'R_NA', 'O_A', 'B_A'], default='R_A',
                        help='R_A: random split with data augmentation, R_NA: random split without data augmentation, O_A: order split with data augmentation, B_A: bearing split with data augmentation')
    parser.add_argument('--cuda_device', type=str, default='0', help='assign device')
    parser.add_argument('--checkpoint_dir', type=str, default='./checkpoint/best', help='the directory containing the model')
    parser.add_argument('--results_dir', type=str, default='./test_results', help='the directory to contain the results')
    parser.add_argument('--batch_size', type=int, default=64, help='batchsize of the training process')
    parser.add_argument('--num_workers', type=int, default=0, help='the number of training process')

    args = parser.parse_args()
    return args

def report(args, results, duration, save_dir):
    names = list(args.__dict__.keys())+list(results.keys())+['days', 'seconds', 'microseconds', 'save_dir']
    values = list(args.__dict__.values())+list(results.values())+[duration.days, duration.seconds, duration.microseconds, save_dir]

    data_file = os.path.join(args.results_dir, 'test_results.csv')
    write_title = not os.path.exists(data_file)
    with open(data_file, 'a') as f:
        if write_title:
            f.write(','.join([str(i) for i in names])+'\n')
        f.write(','.join([str(i) for i in values])+'\n')

def model_file_name_from_args(args):
    columns = ['model_name', 'data_name', 'processing_type']
    return '-'.join([args.__dict__[c] for c in columns]) + '.pth'

if __name__ == '__main__':

    start_tm = datetime.now()
    args = parse_args()
    os.environ['CUDA_VISIBLE_DEVICES'] = args.cuda_device.strip()
    # Prepare the saving path for the test results
    sub_dir = args.model_name+'_'+args.data_name + '_' + datetime.strftime(start_tm, '%m%d-%H%M%S')
    save_dir = os.path.join(args.results_dir, sub_dir)
    if not os.path.exists(save_dir):
        os.makedirs(save_dir)

    # Calculate the model file name
    model_file_name = model_file_name_from_args(args)

    # set the logger
    setlogger(os.path.join(save_dir, 'testing.log'))

    # save the args
    for k, v in args.__dict__.items():
        logging.info("{}: {}".format(k, v))

    tester = test_utils(args, save_dir, model_file_name)
    tester.setup()
    results = tester.test()
    end_tm = datetime.now()
    duration = end_tm - start_tm

    report(args=args, results=results, duration=duration, save_dir=save_dir)





