# Importing Image class from PIL module
from PIL import Image
 
# Opens a image in RGB mode
name = 'img'
filename = 'jpeg/ori_' + name + '.jpg'
im = Image.open(filename)
 
# Size of the image in pixels (size of original image)
width, height = im.size
 
# Setting the points for cropped image
left = 1000
top = 1000
right = left + min(640, width)
bottom = top + min(480, height)
 
# Cropped image of above dimension
im1 = im.crop((left, top, right, bottom))
 
# Save the image
im1 = im1.save('jpeg/' + name + '1.jpg')


# Second img
left = 1200
top = 1100
right = left + min(640, width)
bottom = top + min(480, height)
im2 = im.crop((left, top, right, bottom))
im2 = im2.save('jpeg/' + name + '2.jpg')