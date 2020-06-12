#!/usr/bin/python
# -*- coding:utf-8 -*-

import pandas as pd
import numpy as np

print('Train')
df = pd.read_csv('checkpoint/results.csv')
#print(df.columns)
print(df[['model_name', 'data_name', 'processing_type', 'best_acc', 'macs', 'params', 'seconds', 'best_epoch']][df['data_name'].str.contains('PU')])

print('Test')
df = pd.read_csv('test_results/test_results.csv')
#print(df.columns)
print(df[['model_name', 'data_name', 'processing_type', 'accuracy', 'seconds']][df['data_name'].str.contains('PU')])
