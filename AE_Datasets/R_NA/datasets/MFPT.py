import os
import pandas as pd
from scipy.io import loadmat
from sklearn.model_selection import train_test_split
from datasets.SequenceDatasets import dataset
from datasets.sequence_aug import *
from tqdm import tqdm

signal_size=1024

#label
label1 = [1,2,3,4,5,6,7]
label2 = [ 8,9,10,11,12,13,14]   #The failure data is labeled 1-14

#generate Training Dataset and Testing Dataset
def get_files(root, test=False):
    '''
    This function is used to generate the final training set and test set.
    root:The location of the data set
    '''
    m = os.listdir(root)
    datasetname = os.listdir(os.path.join("/tmp", root, m[0]))  # '1 - Three Baseline Conditions'
    # '2 - Three Outer Race Fault Conditions'
    # '3 - Seven More Outer Race Fault Conditions'
    # '4 - Seven Inner Race Fault Conditions'
    # '5 - Analyses',
    # '6 - Real World Examples
    # Generate a list of data
    dataset1 = os.listdir(os.path.join("/tmp", root, m[0], datasetname[0]))  # 'Three Baseline Conditions'
    dataset2 = os.listdir(os.path.join("/tmp", root, m[0], datasetname[2]))  # 'Seven More Outer Race Fault Conditions'
    dataset3 = os.listdir(os.path.join("/tmp", root, m[0], datasetname[3]))  # 'Seven Inner Race Fault Conditions'
    data_root1 = os.path.join('/tmp',root,m[0],datasetname[0])  #Path of Three Baseline Conditions
    data_root2 = os.path.join('/tmp',root,m[0],datasetname[2])  #Path of Seven More Outer Race Fault Conditions
    data_root3 = os.path.join('/tmp',root,m[0],datasetname[3])  #Path of Seven Inner Race Fault Conditions
    
    path1=os.path.join('/tmp',data_root1,dataset1[0])
    data, lab = data_load(path1,label=0)  #The label for normal data is 0

    for i in tqdm(range(len(dataset2))):
        path2=os.path.join('/tmp',data_root2,dataset2[i])
        data1, lab1 = data_load(path2,label=label1[i])
        data += data1
        lab += lab1

    for j in tqdm(range(len(dataset3))):
        path3=os.path.join('/tmp',data_root3,dataset3[j])

        data2, lab2  = data_load(path3,label=label2[j])
        data += data2
        lab += lab2

    return [data,lab]

def data_load(filename,label):
    '''
    This function is mainly used to generate test data and training data.
    filename:Data location
    '''
    if label==0:
        fl = (loadmat(filename)["bearing"][0][0][1])     #Take out the data
    else:
        fl = (loadmat(filename)["bearing"][0][0][2])     #Take out the data

    data=[] 
    lab=[]
    start,end=0,signal_size
    while end<=fl.shape[0]:
        data.append(fl[start:end])
        lab.append(label)
        start +=signal_size
        end +=signal_size
    return data,lab

def data_transforms(dataset_type="train", normalise_type="-1-1"):
    transforms = {
        'train': Compose([
            Reshape(),
            Normalize(normalise_type),
            Retype()

        ]),
        'val': Compose([
            Reshape(),
            Normalize(normalise_type),
            Retype()
        ])
    }
    return transforms[dataset_type]
#--------------------------------------------------------------------------------------------------------------------
class MFPT(object):
    num_classes = 15
    inputchannel = 1

    def __init__(self, data_dir,normalise_type):
        self.data_dir = data_dir
        self.normalise_type = normalise_type

    def data_preprare(self, test=False):
        list_data = get_files(self.data_dir, test)
        if test:
            test_dataset = dataset(list_data=list_data, test=True, transform=data_transforms('val',self.normalise_type))
            return test_dataset
        else:
            data_pd = pd.DataFrame({"data": list_data[0], "label": list_data[1]})
            train_pd, val_pd = train_test_split(data_pd, test_size=0.2, random_state=40, stratify=data_pd["label"])
            train_dataset = dataset(list_data=train_pd, transform=data_transforms('train',self.normalise_type))
            val_dataset = dataset(list_data=val_pd, transform=data_transforms('val',self.normalise_type))
            return train_dataset, val_dataset
