from PIL import Image
import numpy as np
import re

name = 'img1'
filename = 'jpeg/' + name + '.jpg'

img = Image.open(filename)
#img = img.convert('RGB')
img = np.array(img)

print(img.size)
print(img.shape)
#print(img)

str = ''
for i in range(720):
    for j in range(1280):
        hexVal = hex(img[i][j])
        if(len(hexVal) == 3):
            hexVal = '0x0' + hexVal[2]
        str += hexVal + '\n'

str = re.sub('0x', '', str) # Replace '0x' with 'x' for your needs

save_dir = 'bf/' + name + '.txt'
save_file = open(save_dir, 'w')
save_file.write(str)
save_file.close()


