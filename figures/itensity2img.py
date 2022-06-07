import re
import numpy as np
from PIL import Image

import matplotlib.pyplot as plt

#filename = 'bf/img1.txt'
filename = '../test/result/filtered/out22.txt'
with open(filename) as file:
    data = file.read()

data = re.sub('\n', '', data)
data = [int(data[i:i+2],16) for i in range(0,len(data),2)]
print(len(data))

data = np.reshape(data, (720, 1280))
print(data.shape)


plt.imshow(data, cmap='gray', vmin=0, vmax=255)
plt.show()
