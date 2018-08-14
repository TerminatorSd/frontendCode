#coding=utf-8
import requests
import re
import pandas as pd

url_first='https://movie.douban.com/subject/26363254/comments?start=0'
head={'User-Agent':'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'}
cookies={'cookie':'bid=63-iiMSy-qA; viewed="1613324"; gr_user_id=abf833d5-00fe-45b9-8901-742caf0643a5; ll="118226"; _pk_ref.100001.8cb4=%5B%22%22%2C%22%22%2C1506734873%2C%22https%3A%2F%2Fwww.baidu.com%2Flink%3Furl%3Dgp-4iqVfvOItC8VKr4WjjiNJ0dxGWzSLmYqw8SAqcUy%26wd%3D%26eqid%3Da954aa90000121060000000259cf6397%22%5D; __utmt=1; _ga=GA1.2.1149246952.1488999790; _gid=GA1.2.1984603832.1506734902; _vwo_uuid_v2=95DC03580C0FEE872243EB66F24C6C1F|3f7fce6e247982793359b11e583941b7; ap=1; ps=y; ue="adxcsmlx@163.com"; dbcl2="151613780:7j2+VLdOizg"; ck=MFqD; _pk_id.100001.8cb4=51a94297d0df474c.1488999789.2.1506735443.1488999789.; _pk_ses.100001.8cb4=*; push_noty_num=0; push_doumail_num=0; __utma=30149280.1149246952.1488999790.1496721911.1506734874.4; __utmb=30149280.3.10.1506734874; __utmc=30149280; __utmz=30149280.1506734874.4.4.utmcsr=baidu|utmccn=(organic)|utmcmd=organic; __utmv=30149280.15161; __yadk_uid=KF0gH0TDh1A1rsK1brDCVNkR9yF96tyy'}
html=requests.get(url_first,headers=head,cookies=cookies)

reg=re.compile(r'<a href="(.*?)&amp;.*?class="next">') #下一页
ren=re.compile(r'<span class="votes">(.*?)</span>.*?comment">(.*?)</a>.*?</span>.*?<span>(.*?)</span>.*?title="(.*?)"></span>.*?title="(.*?)">.*?class=""> (.*?)\n',re.S)  #评论等内容
num = 1
while html.status_code==200:
    url_next='https://movie.douban.com/subject/26363254/comments'+re.findall(reg,html.text)[0]
    zhanlang=re.findall(ren,html.text)
    data=pd.DataFrame(zhanlang)
    # data = data[[0,2,3,4,6]]
    data.to_csv('/home/xsd/Deep_Learning/Python_code/wolf/zl5.csv', header=["赞成评论数","评论有用","是否看过","五星数","评论时间","评论内容"],index=False,mode='a+',encoding='utf-8') #写入csv文件,'a+'是追加模式
    html=requests.get(url_next,cookies=cookies,headers=head)
    print 'Have finished ',num,'* 10条数据...'
    num += 1