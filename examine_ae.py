#!/usr/bin/python
# -*- coding:utf-8 -*-

import pandas as pd
import numpy as np

df = pd.read_csv('checkpoint/results_ae.csv')
print(df.columns)
print(df[['model_name', 'data_name', 'processing_type', 'best_acc', 'emacs', 'eparams', 'dmacs', 'dparams', 'seconds', 'best_epoch']])
