# Importing Image class from PIL module
from PIL import Image
 
# Opens a image in RGB mode
name = 'img'
filename = './jpeg/ori_' + name + '.jpg'
im = Image.open(filename)

print(im.size)
 
# Size of the image in pixels (size of original image)
width, height = im.size
print(width, height)
 
# Setting the points for cropped image
left = 1000
top = 1000
right = left + min(1280, width)
bottom = top + min(720, height)
 
# Cropped image of above dimension
im1 = im.crop((left, top, right, bottom)).convert('L')

 
# Save the image
im1 = im1.save('jpeg/' + name + '1.jpg')


# Second img
left = 800
top = 900
right = left + min(1280, width)
bottom = top + min(720, height)
im2 = im.crop((left, top, right, bottom))
im2 = im2.save('jpeg/' + name + '2.jpg')
