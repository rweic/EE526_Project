import re
import binascii

with open('bf/img1.txt') as file:
    data = file.read()
'''
data = re.sub('\n', '', data)
data = bytes.fromhex(data[2:])
'''

data=data.replace('\n', '')
data = binascii.a2b_hex(data)

with open('regenerated/img1.jpg', 'wb') as file:
    file.write(data)
