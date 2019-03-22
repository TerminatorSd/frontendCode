# from urllib import request
# import urllib2, urllib
# import signal
import requests

path ='./dog.txt'


# def handler(signum, frame):
#     raise AssertionError

file = open(path)

for line in file:
    try:
        pic = requests.get(line, timeout=15)
        folder = './dog/'
        string = folder + line.split('/')[-1].strip().replace('\n', '')
        with open(string, 'wb') as f:
            f.write(pic.content)
            print('Successfully done: %s' % line.split('/')[-1])
    except Exception as e:
        print('Failure: %s' % line.split('/')[-1])
        print(e)
        continue
    # try:
    #     signal.signal(signal.SIGALRM, handler)
    #     signal.alarm(5)

    #     print(line)
    #     # # fake header
    #     # headers = {'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'}
    #     # req = urllib.request.Request(url=line, headers=headers)
    #     # urllib.request.urlopen(req).read()

    #     try:

    #         f = urllib2.urlopen(line)
    #         data = f.read()
    #         with open('./dog/%s ' % line.split('/')[-1], "wb") as code:
    #             code.write(data)
    #     except:
    #         pass



    #     # pic_link = line
    #     # save_path = r'/home/hzc/Pictures/%s.JPG '% line.split('/')[-1]
    #     # request.urlretrieve(pic_link, save_path)
    # except AssertionError:
    #     print("%s timeout " % line)
    #     continue

file.close()
