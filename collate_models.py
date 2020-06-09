#!/usr/bin/python
# -*- coding:utf-8 -*-

import pandas as pd
import numpy as np
import sys 
from pathlib import Path 
import shutil

def name_from_row(row):
    columns = ['model_name', 'data_name', 'processing_type']
    return '-'.join([row[c] for c in columns]) + '.pth'

def copy_best(row, dest_dir):
    sd = Path(row['save_dir'])
    all_dirs = list(sd.glob('*-best_model.pth'))
    all_dirs.sort()
    best = all_dirs[-1]
    shutil.copy(str(best), str(dest_dir / name_from_row(row)))

def collate_all():
    dest_dir = Path('./checkpoint/best')
    dest_dir.mkdir(parents=False, exist_ok=True)
    df = pd.read_csv('checkpoint/results.csv')
    df = df.sort_values(['best_acc'], axis='index',ascending=True)
    for index, row in df.iterrows():
        copy_best(row, dest_dir)

if __name__ == '__main__':
    collate_all()


