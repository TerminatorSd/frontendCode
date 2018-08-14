#coding=utf-8
import numpy as np
import sys,os

#设置当前目录
caffe_root = '/home/xsd/Deep_Learning/caffe/'
sys.path.insert(0, caffe_root + 'python')
import caffe
os.chdir(caffe_root)

# extract feature of images in a certain folder and write them to the files
def extract_feature(base_dir, feature_path, net, transformer, blob):
    items = os.listdir(base_dir)
    for i in range(0, len(items)):
        path = os.path.join(base_dir, items[i])

        im = caffe.io.load_image(path)
        net.blobs['data'].data[...] = transformer.preprocess('data', im)
        out = net.forward()

        encode = net.blobs[blob].data[0].flatten()
        code = []
        total = 0
        for k in np.arange(encode.size):
            total += encode[k]
        avg = total/encode.size

        for j in np.arange(encode.size):
            if (encode[j] >= avg):
                code.append('1')
            else:
                code.append('0')
            # print code[j],

        to_path = os.path.join(feature_path, items[i].split('.')[0] + '.txt')
        feature = open(to_path, 'w')
        try:
            feature.write(''.join(code))
            feature.write('\n')
        finally:
            feature.close()
        print to_path

def extract_feature_of_target(image, net, transformer, blob):
    im = caffe.io.load_image(image)
    net.blobs['data'].data[...] = transformer.preprocess('data', im)
    out = net.forward()

    encode = net.blobs[blob].data[0].flatten()
    code = []
    total = 0
    for k in np.arange(encode.size):
        total += encode[k]
    avg = total / encode.size

    for j in np.arange(encode.size):
        # print encode[j]
        if (encode[j] >= avg):
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

