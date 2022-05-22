import binascii
import re
from PIL import Image
#import cv2

# read the input file
name = 'img1'
'''
filename = 'jpeg/' + name + '.jpg'

with open(filename, 'rb') as f:
    content = f.read()
print(len(content))

# convert to binary
binary_content = binascii.hexlify(content)
'''

filename = 'jpeg/' + name + '.jpg'
def imgToHex(file):
    string = ''
    with open(file, 'rb') as f:
        binValue = f.read(1)
        while len(binValue) != 0:
            hexVal = hex(ord(binValue))
            if(len(hexVal) == 3):
               hexVal = '0x0' + hexVal[2]
            #string += '\\' + hexVal
            string +=  hexVal + '\n'
            binValue = f.read(1)
    string = re.sub('0x', '', string) # Replace '0x' with 'x' for your needs
    return string
output = imgToHex(filename)
print(len(output))

# savefile
save_dir = 'bf/' + name + '.txt'
save_file = open(save_dir, 'w')
#output = repr(binary_content)
save_file.write(output)
save_file.close()
