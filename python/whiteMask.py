# 把缺失区域的灰色均值变为白色
import cv2

folder = '../img/seg/car'

img = cv2.imread(folder + 'gl_input.jpg')
mask = cv2.imread(folder + 'black_zero_mask.jpg')

width = mask.shape[1]
height = mask.shape[0]
channel = mask.shape[2]

print(mask.shape)

for row in range(height):
  for col in range(width):
    if mask[col][row][0] < 10:
      for c in range(channel):
        img[col][row][c] = 255

cv2.imwrite(folder + 'input_with_white_mask.jpg', img)