import numpy as np
import cv2
from matplotlib import pyplot as plt
import csv


# Import input images
img1 = cv2.imread('jpeg/img21.jpg')
img2 = cv2.imread('jpeg/img22.jpg')
  
# Convert to grayscale
query_img_bw = cv2.cvtColor(img1, cv2.COLOR_BGR2GRAY)
train_img_bw = cv2.cvtColor(img2, cv2.COLOR_BGR2GRAY)
  
# Initialize the ORB detector algorithm
#orb = cv2.ORB_create()
fast = cv2.FastFeatureDetector_create()
  
# Detect the keypoints and compute descriptors
#queryKeypoints, queryDescriptors = orb.detectAndCompute(query_img_bw,None)
#trainKeypoints, trainDescriptors = orb.detectAndCompute(train_img_bw,None)
#kps = fast.detect(query_img_bw,60)

orb = cv2.ORB_create()
queryKeypoints, queryDescriptors = orb.detectAndCompute(query_img_bw,None)


x1 = []
y1 = []
size1 = []
for queryKeypoint in queryKeypoints:
  kp = queryKeypoint
  if (kp.pt[0] > 15 and kp.pt[0] <1265 and kp.pt[1] > 15 and kp.pt[1]< 705):
    x1.append(int(kp.pt[0]))
    y1.append(int(kp.pt[1]))
    size1.append(int(kp.size))
    #print(kp.size)
  #print(kp.pt[0],kp.pt[1])

#np.savetxt('x_1.csv', np.array(x1), delimiter=',')
#np.savetxt('y_1.csv', np.array(y1), delimiter=',')
with open('x_1.csv', 'w', newline='') as file:
    mywriter = csv.writer(file, delimiter=',')
    mywriter.writerow(np.array(x1))
with open('y_1.csv', 'w', newline='') as file:
    mywriter = csv.writer(file, delimiter=',')
    mywriter.writerow(np.array(y1))
print(len(x1))
    
    
#kps = fast.detect(train_img_bw,60)
trainKeypoints, trainDescriptors = orb.detectAndCompute(train_img_bw,None)

x2 = []
y2 = []
size2 = []
for trainKeypoint in trainKeypoints:
  kp = trainKeypoint
  if (kp.pt[0] > 15 and kp.pt[0] <1265 and kp.pt[1] > 15 and kp.pt[1]< 705):
    x2.append(int(kp.pt[0]))
    y2.append(int(kp.pt[1]))
    size2.append(int(kp.size))
  #print(kp.pt[0],kp.pt[1])

with open('x_2.csv', 'w', newline='') as file:
    mywriter = csv.writer(file, delimiter=',')
    mywriter.writerow(np.array(x2))
with open('y_2.csv', 'w', newline='') as file:
    mywriter = csv.writer(file, delimiter=',')
    mywriter.writerow(np.array(y2))
print(len(x2))
