#coding=utf-8

#urllib模块提供了读取Web页面数据的接口
import urllib
#re模块主要包含了正则表达式
import re
#定义一个getHtml()函数
def getHtml(url):
    page = urllib.urlopen(url)  #urllib.urlopen()方法用于打开一个URL地址
    html = page.read() #read()方法用于读取URL上的数据
    # print html
    return html

def getImg(html):
    reg = 'src="(.+?\.jpg)"'   #正则表达式，得到图片地址
    reg_2 = 'src="(.+?\.png)"'
    imgre = re.compile(reg)     #re.compile() 可以把正则表达式编译成一个正则表达式对象.
    imgre_2 = re.compile(reg_2)
    imglist = re.findall(imgre,html)      #re.findall() 方法读取html 中包含 imgre（正则表达式）的    数据
    imglist_2 = re.findall(imgre_2, html)
    #把筛选的图片地址通过for循环遍历并保存到本地
    #核心是urllib.urlretrieve()方法,直接将远程数据下载到本地，图片通过x依次递增命名
    x = 0
    y = 0
    for imgurl in imglist:
        urllib.urlretrieve(imgurl,'/Users/shaodong/myGit/ganCode/data/dog/%s.jpg' % x)
        x+=1

    # for imgurl_2 in imglist_2:
    #     urllib.urlretrieve(imgurl_2, '/home/xsd/Deep_Learning/Python_code/images/%s.png' % x)
    #     y += 1
    return "Done!"

url = "https://image.baidu.com/search/index?isource=infinity&iname=baidu&tn=baiduimage&word=dog"
html = getHtml(url)
print (getImg(html))