#coding=utf-8
#加载必要的库
import numpy as np

import sys,os

import baseFunctions as bf

#设置当前目录
caffe_root = '/home/xsd/Deep_Learning/caffe/'
sys.path.insert(0, caffe_root + 'python')
import caffe
os.chdir(caffe_root)

net_file=caffe_root + 'models/Router_alx/alexnet_train_val.prototxt'
caffe_model=caffe_root + 'models/Router_alx/alexnet_router.caffemodel'
mean_file=caffe_root + 'models/Router_alx/mean.npy'

net = caffe.Net(net_file,caffe_model,caffe.TEST)
transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})
transformer.set_transpose('data', (2,0,1))
transformer.set_mean('data', np.load(mean_file).mean(1).mean(1))
transformer.set_raw_scale('data', 255)
transformer.set_channel_swap('data', (2,1,0))


def extract_feature_of_target(image):
    im = caffe.io.load_image(image)
    net.blobs['data'].data[...] = transformer.preprocess('data', im)
    out = net.forward()

    encode = net.blobs['fc8'].data[0].flatten()

    print encode
    # code = []
    # for j in np.arange(encode.size):
    #     # print encode[j]
    #     if (encode[j] >= 0.5):
    #         code.append('1')
    #     else:
    #         code.append('0')
    # return code


if __name__ == '__main__':

    images = ['random.jpeg', 'white_one.jpg', 'white_two.jpg', 'white_three.jpg', 'black_one.jpg', 'black_two.jpg']
    for img in images:
        extract_feature_of_target('/home/xsd/Deep_Learning/Router/' + img)