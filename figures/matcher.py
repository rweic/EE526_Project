import numpy as np
import cv2

# Import input images
img1 = cv2.imread('jpeg/img21.jpg')
img2 = cv2.imread('jpeg/img22.jpg')
  
# Convert to grayscale
#query_img_bw = cv2.cvtColor(img1, cv2.COLOR_BGR2GRAY)
#train_img_bw = cv2.cvtColor(img2, cv2.COLOR_BGR2GRAY)
  
# Initialize the ORB detector algorithm
#orb = cv2.ORB_create()
  
# Detect the keypoints and compute descriptors
#queryKeypoints, queryDescriptors = orb.detectAndCompute(query_img_bw,None)
#trainKeypoints, trainDescriptors = orb.detectAndCompute(train_img_bw,None)

with open("bf/x_1.csv") as file_name:
    x1 = np.loadtxt(file_name, delimiter=",")
with open("bf/y_1.csv") as file_name:
    y1 = np.loadtxt(file_name, delimiter=",")
with open("bf/x_2.csv") as file_name:
    x2 = np.loadtxt(file_name, delimiter=",")
with open("bf/y_2.csv") as file_name:
    y2 = np.loadtxt(file_name, delimiter=",")
with open("bf/size_1.csv") as file_name:
    size1 = np.loadtxt(file_name, delimiter=",")
with open("bf/size_2.csv") as file_name:
    size2 = np.loadtxt(file_name, delimiter=",")

print(len(x1), len(y1))
print(len(x2), len(y2))
queryKeypoints = [] 
for i in range(len(x1)):
     queryKeypoints.append(cv2.KeyPoint(x1[i], y1[i], 1))
     
trainKeypoints = []  
for i in range(len(x2)):
     trainKeypoints.append(cv2.KeyPoint(x2[i], y2[i], 1))
     
     
with open("bf/brief_out1.txt") as file_name:
     queryDescriptors = np.loadtxt(file_name, delimiter=",",dtype ='int').astype(np.uint8)
     queryDescriptors = np.resize(queryDescriptors,(len(x1),32))

with open("bf/brief_out2.txt") as file_name:
     trainDescriptors = np.loadtxt(file_name, delimiter=",",dtype ='int').astype(np.uint8)
     trainDescriptors = np.resize(trainDescriptors,(len(x2),32))

# printing

print(len(queryKeypoints)) 
print(queryDescriptors.shape) 
print(queryDescriptors)
 

# Match points
matcher = cv2.BFMatcher()
matches = matcher.match(queryDescriptors,trainDescriptors)
  
# draw the matches
final_img = cv2.drawMatches(img1, queryKeypoints, img2, trainKeypoints, matches[0:50],None)

final_img = cv2.resize(final_img, (2560,720))
 
# Show the final image
cv2.imshow("Matches", final_img)
cv2.waitKey(20000)
