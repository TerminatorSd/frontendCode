#coding=utf-8
#加载必要的库
import numpy as np

import sys,os

#设置当前目录
caffe_root = '/home/xsd/Deep_Learning/caffe/'
sys.path.insert(0, caffe_root + 'python')
import caffe
os.chdir(caffe_root)

net_file=caffe_root + 'models/bvlc_reference_caffenet/KevinNet_CIFAR10_deploy32.prototxt'
caffe_model=caffe_root + 'models/bvlc_reference_caffenet/KevinNet_CIFAR10_32.caffemodel'
mean_file=caffe_root + 'python/caffe/imagenet/ilsvrc_2012_mean.npy'

net = caffe.Net(net_file,caffe_model,caffe.TEST)
transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})
transformer.set_transpose('data', (2,0,1))
transformer.set_mean('data', np.load(mean_file).mean(1).mean(1))
transformer.set_raw_scale('data', 255)
transformer.set_channel_swap('data', (2,1,0))

# extract feature of images in a certain folder and write them to the files
def extract_feature(base_dir, feature_path):
    items = os.listdir(base_dir)
    for i in range(0, len(items)):
        path = os.path.join(base_dir, items[i])

        im = caffe.io.load_image(path)
        net.blobs['data'].data[...] = transformer.preprocess('data', im)
        out = net.forward()

        encode = net.blobs['fc8_kevin_encode'].data[0].flatten()
        code = []
        for j in np.arange(encode.size):
            if (encode[j] >= 0.5):
                code.append('1')
            else:
                code.append('0')
            # print code[j],
        # print ''

        to_path = os.path.join(feature_path, items[i].split('.')[0] + '.txt')
        feature = open(to_path, 'w')
        try:
            feature.write(''.join(code))
            feature.write('\n')
        finally:
            feature.close()
        print to_path

def extract_feature_of_target(image):
    im = caffe.io.load_image(image)
    net.blobs['data'].data[...] = transformer.preprocess('data', im)
    out = net.forward()

    encode = net.blobs['fc8_kevin_encode'].data[0].flatten()
    code = []
    for j in np.arange(encode.size):
        # print encode[j]
        if (encode[j] >= 0.5):
            code.append('1')
        else:
            code.append('0')
    return code

def printTopk(topk, sort):
    print 'The result of top ' + str(topk) + ' is: '
    i = 0
    for item in sort:
        if(i < topk):
            print item[0], item[1]
            i += 1

def calculate_hamming_distance(feature_path, code, topk):
    feature_dic = {}
    items2 = os.listdir(feature_path)
    for i in range(0, len(items2)):
        path2 = os.path.join(feature_path, items2[i])
        feature_read = open(path2, 'r')
        try:
            temp = feature_read.readlines()
            dif = 0
            for line in temp:
                # print path2.split('/')[len(path2.split('/')) - 1],
                # print line
                for k in range(0, len(code)):
                    if(code[k] != line[k]):
                        dif += 1
            feature_dic[path2.split('/')[len(path2.split('/')) - 1]] = dif
        finally:
            feature_read.close()
    sort = sorted(feature_dic.iteritems(), key = lambda asd:asd[1], reverse = False)
    printTopk(topk, sort)

