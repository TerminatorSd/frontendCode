#coding=utf-8

from struct import *

file = open(r"/home/xsd/Deep_Learning/caffe/examples/router_lmdb/mean.npy","rb")
a = unpack("idh", file.read(8+8+2))
print(a)
file.close()