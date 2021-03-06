import numpy as np
import cv2

# Import input images
img1 = cv2.imread('jpeg/img21.jpg')
img2 = cv2.imread('jpeg/img22.jpg')
  
# Convert to grayscale
query_img_bw = cv2.cvtColor(img1, cv2.COLOR_BGR2GRAY)
train_img_bw = cv2.cvtColor(img2, cv2.COLOR_BGR2GRAY)
  
# Initialize the ORB detector algorithm
orb = cv2.ORB_create()
  
# Detect the keypoints and compute descriptors
queryKeypoints, queryDescriptors = orb.detectAndCompute(query_img_bw,None)
trainKeypoints, trainDescriptors = orb.detectAndCompute(train_img_bw,None)

# printing

#print(len(queryKeypoints)) 
#print(queryKeypoints) 


print(queryDescriptors) 
print(type(queryDescriptors[0][0]))
 
# Match points
matcher = cv2.BFMatcher()
matches = matcher.match(queryDescriptors,trainDescriptors)
  
# draw the matches
final_img = cv2.drawMatches(img1, queryKeypoints, img2, trainKeypoints, matches[:50],None)
  
final_img = cv2.resize(final_img, (2560,720))
 
# Show the final image
cv2.imshow("Matches", final_img)
cv2.waitKey(30000)
