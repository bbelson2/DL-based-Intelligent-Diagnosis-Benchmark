#!/usr/bin/python
# -*- coding:utf-8 -*-

import logging
import os
import time
import warnings
import torch
from torch import nn
from torch import optim
import models
from pathlib import Path

class test_utils(object):
    def __init__(self, args, save_dir, model_file_name):
        self.args = args
        self.save_dir = save_dir
        self.model_file_name = model_file_name

    def setup(self):
        """
        Initialize the datasets & model
        :return:
        """
        args = self.args

        # Consider the gpu or cpu condition
        if torch.cuda.is_available():
            self.device = torch.device("cuda")
            self.device_count = torch.cuda.device_count()
            logging.info('using {} gpus'.format(self.device_count))
            assert args.batch_size % self.device_count == 0, "batch size should be divided by device count"
        else:
            warnings.warn("gpu is not available")
            self.device = torch.device("cpu")
            self.device_count = 1
            logging.info('using {} cpu'.format(self.device_count))


        # Load the datasets
        if args.processing_type == 'O_A':
            from CNN_Datasets.O_A import datasets
            Dataset = getattr(datasets, args.data_name)
        elif args.processing_type == 'R_A':
            from CNN_Datasets.R_A import datasets
            Dataset = getattr(datasets, args.data_name)
        elif args.processing_type == 'R_NA':
            from CNN_Datasets.R_NA import datasets
            Dataset = getattr(datasets, args.data_name)
        elif args.processing_type == 'B_A':
            from CNN_Datasets.B_A import datasets
            Dataset = getattr(datasets, args.data_name)
        else:
            raise Exception("processing type not implement")

        print(Dataset)

        self.datasets = {}

        self.datasets['val'] = Dataset(args.data_dir,args.normalise_type).data_preprare(test=True)

        self.dataloaders = {x: torch.utils.data.DataLoader(self.datasets[x], batch_size=args.batch_size,
                                                           shuffle=(True if x == 'train' else False),
                                                           num_workers=args.num_workers,
                                                           pin_memory=(True if self.device == 'cuda' else False))
                            for x in ['val']}
        # Define the model
        self.model = getattr(models, args.model_name)(in_channel=Dataset.inputchannel, out_channel=Dataset.num_classes)
        if self.device_count > 1:
            self.model = torch.nn.DataParallel(self.model)

        # Invert the model and define the loss
        self.model.to(self.device)
        self.criterion = nn.CrossEntropyLoss()

        model_path = Path(args.checkpoint_dir) / self.model_file_name
        logging.info('Loading path from {}'.format(model_path))
        checkpoint = torch.load(model_path)
        self.model.load_state_dict(checkpoint['model_state_dict'])

        # Model will only be used for evaluation
        self.model.eval()

    def test(self):
        """
        Training process
        :return: results
        """
        # Define the temp variable
        epoch_start = time.time()
        epoch_acc = 0
        epoch_loss = 0.0
        phase = 'val'
        input_count = 0

        for batch_idx, (inputs, labels) in enumerate(self.dataloaders[phase]):
            inputs = inputs.to(self.device)
            labels = labels.to(self.device)

            # Do the learning process, in val, we do not care about the gradient for relaxing
            with torch.set_grad_enabled(False):

                # forward
                logits = self.model(inputs)
                loss = self.criterion(logits, labels)
                pred = logits.argmax(dim=1)
                correct = torch.eq(pred, labels).float().sum().item()
                loss_temp = loss.item() * inputs.size(0)
                epoch_loss += loss_temp
                epoch_acc += correct
                input_count += inputs.size(0)

        # Print the train and val information via each epoch
        epoch_loss = epoch_loss / len(self.dataloaders[phase].dataset)
        epoch_acc = epoch_acc / len(self.dataloaders[phase].dataset)

        logging.info('Test: {}-Loss: {:.4f} {}-Acc: {:.4f}, Cost {:.4f} sec'.format(
            phase, epoch_loss, phase, epoch_acc, time.time()-epoch_start
        ))

        return {'accuracy': epoch_acc }









