import binascii
import cv2

# read the input file
name = 'img1'
filename = 'jpeg/' + name + '.jpg'
with open(filename, 'rb') as f:
    content = f.read()
print(len(content))

# convert to binary
binary_content = binascii.hexlify(content)

# savefile
save_dir = 'bf/' + name + '.txt'
save_file = open(save_dir, 'w')
output = repr(binary_content)
save_file.write(output)
save_file.close()
