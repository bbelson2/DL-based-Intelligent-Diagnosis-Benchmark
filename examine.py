#!/usr/bin/python
# -*- coding:utf-8 -*-

import pandas as pd
import numpy as np

df = pd.read_csv('checkpoint/results.csv')
print(df.columns)
print(df[['model_name', 'data_name', 'processing_type', 'best_acc', 'macs', 'params', 'seconds', 'best_epoch']])
