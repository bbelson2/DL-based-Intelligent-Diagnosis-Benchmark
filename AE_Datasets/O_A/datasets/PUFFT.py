import os
import numpy as np 
import pandas as pd
from scipy.io import loadmat
from sklearn.model_selection import train_test_split
from datasets.SequenceDatasets import dataset
from datasets.sequence_aug import *
from tqdm import tqdm


#Digital data was collected at 40,000 samples per second
signal_size = 1024

#1 Undamaged (healthy) bearings(6X)
HBdata = ['K001',"K002",'K003','K004','K005','K006']
label1=[0,1,2,3,4,5]  #The undamaged (healthy) bearings data is labeled 1-9
#2 Artificially damaged bearings(12X)
ADBdata = ['KA01','KA03','KA05','KA06','KA07','KA08','KA09','KI01','KI03','KI05','KI07','KI08']
label2=[6,7,8,9,10,11,12,13,14,15,16,17]    #The artificially damaged bearings data is labeled 4-15
#3 Bearings with real damages caused by accelerated lifetime tests(14x)
# RDBdata = ['KA04','KA15','KA16','KA22','KA30','KB23','KB24','KB27','KI04','KI14','KI16','KI17','KI18','KI21']
# label3=[18,19,20,21,22,23,24,25,26,27,28,29,30,31]  #The artificially damaged bearings data is labeled 16-29
RDBdata = ['KA04','KA15','KA16','KA22','KA30','KB23','KB24','KB27','KI04','KI16','KI17','KI18','KI21']
label3 = [i for i in range(13)]

#working condition
WC = ["N15_M07_F10","N09_M07_F10","N15_M01_F10","N15_M07_F04"]
state = WC[0] #WC[0] can be changed to different working states

#generate Training Dataset and Testing Dataset
def get_files(root, test=False):
    '''
    This function is used to generate the final training set and test set.
    root:The location of the data set
    '''
    data = []
    lab = []
    # for i in tqdm(range(len(HBdata))):
    #     name1 = state+"_"+HBdata[i]+"_1"
    #     path1=os.path.join('/tmp',root,HBdata[i],name1+".mat")        #_1----->1 can be replaced by the number between 1 and 20
    #     data1, lab1 = data_load(path1,name=name1,label=label1[i])
    #     data += data1
    #     lab  += lab1
    #
    # for j in tqdm(range(len(ADBdata))):
    #     name2 = state+"_"+ADBdata[j]+"_1"
    #     path2=os.path.join('/tmp',root,ADBdata[j],name2+".mat")
    #     data2,lab2 = data_load(path2,name=name2,label=label2[j])
    #     data += data2
    #     lab +=lab2

    for k in tqdm(range(len(RDBdata))):
        name3 = state+"_"+RDBdata[k]+"_1"
        path3=os.path.join('/tmp',root,RDBdata[k],name3+".mat")        
        data3, lab3= data_load(path3,name=name3,label=label3[k])
        data +=data3
        lab +=lab3

    return [data,lab]

def data_load(filename,name,label):
    '''
    This function is mainly used to generate test data and training data.
    filename:Data location
    '''
    fl = loadmat(filename)[name]
    fl = fl[0][0][2][0][6][2]  #Take out the data

    fl = fl.reshape(-1,)

    data=[] 
    lab=[]
    start,end=0,signal_size
    while end<=fl.shape[0]:
        x = fl[start:end]
        x = np.fft.fft(x)
        x = np.abs(x) / len(x)
        x = x[range(int(x.shape[0] / 2))]
        x = x.reshape(-1,1)
        data.append(x)
        lab.append(label)
        start +=signal_size
        end +=signal_size

    return data, lab

def data_transforms(dataset_type="train", normalise_type="-1-1"):
    transforms = {
        'train': Compose([
            Reshape(),
            Normalize(normalise_type),
            RandomAddGaussian(),
            RandomScale(),
            RandomStretch(),
            RandomCrop(),
            Retype()

        ]),
        'val': Compose([
            Reshape(),
            Normalize(normalise_type),
            Retype()
        ])
    }
    return transforms[dataset_type]

def train_test_split_order(data_pd, test_size=0.8, num_classes=10):
    train_pd = pd.DataFrame(columns=('data', 'label'))
    val_pd = pd.DataFrame(columns=('data', 'label'))
    for i in range(num_classes):
        data_pd_tmp = data_pd[data_pd['label'] == i].reset_index(drop=True)
        train_pd = train_pd.append(data_pd_tmp.loc[:int((1-test_size)*data_pd_tmp.shape[0]), ['data', 'label']], ignore_index=True)
        val_pd = val_pd.append(data_pd_tmp.loc[int((1-test_size)*data_pd_tmp.shape[0]):, ['data', 'label']], ignore_index=True)
    return train_pd,val_pd
#--------------------------------------------------------------------------------------------------------------------
class PUFFT(object):
    num_classes = 13
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
            train_pd, val_pd = train_test_split_order(data_pd, test_size=0.2, num_classes= 32)
            train_dataset = dataset(list_data=train_pd, transform=data_transforms('train',self.normalise_type))
            val_dataset = dataset(list_data=val_pd, transform=data_transforms('val',self.normalise_type))
            return train_dataset, val_dataset


