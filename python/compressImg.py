#coding=utf-8
# 遍历sourceDir目录，把其中超过1M的图片缩放50%
from PIL import Image
from glob import glob
import os

def get_size(file):
  # 获取文件大小:KB
  size = os.path.getsize(file)
  return size / 1024

def get_outfile(infile, outfile):
  if outfile:
    return outfile
  dir, suffix = os.path.splitext(infile)
  outfile = '{}-out-out{}'.format(dir, suffix)
  return outfile

def compress_image(infile, outfile='', mb=1000, step=10, quality=10):
  """不改变图片尺寸压缩到指定大小
  :param infile: 压缩源文件
  :param outfile: 压缩文件保存地址
  :param mb: 压缩目标，KB
  :param step: 每次调整的压缩比率
  :param quality: 初始压缩比率
  :return: 压缩文件地址，压缩文件大小
  """
  o_size = get_size(infile)
  if o_size <= mb:
    return infile
  
  # 进行第一次压缩
  # outfile = get_outfile(infile, outfile)
  outfile = get_outfile(infile, infile)

  im = Image.open(infile)

  print(infile)
  # im.save(outfile, quality=quality)
  
  # 获得图像尺寸:
  w, h = im.size
  # 缩放到50%:
  im.thumbnail((w//2, h//2))
  # 把缩放后的图像用jpeg格式保存:
  im.save(outfile)

  # o_size = get_size(outfile)
  # print('first compress size: ' + str(o_size))

  # while o_size > mb:
  #   print(str(step) + ' compress')
  #   im = Image.open(outfile)
  #   im.save(outfile, quality=quality)
  #   if quality - step < 0:
  #     break
  #   quality -= step
  #   o_size = get_size(outfile)

  # print(get_size(outfile))

  # return outfile, get_size(outfile)

if __name__ == '__main__':
  sourceDir = '/Users/shaodong/personal/my video/graduate/others'
  fileList = glob('{}/*'.format(sourceDir))
  for file in fileList:
    # print(file)
    compress_image(file)
