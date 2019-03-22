import requests

# read path
path ='./dog.txt'

file = open(path)

for line in file:
    try:
        pic = requests.get(line, timeout=15)

        # write location
        folder = './dog/'
        string = folder + line.split('/')[-1].strip().replace('\n', '')
        with open(string, 'wb') as f:
            f.write(pic.content)
            print('成功下载图片: %s' % line.split('/')[-1])
    except Exception as e:
        print('下载图片时失败: %s' % line.split('/')[-1])
        print(e)
        continue

file.close()
