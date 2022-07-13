#encoding=UTF-8
import rospy
from std_msgs.msg import Header
from sensor_msgs.msg import Image
import sys
import os
import cv2
import numpy as np
import time
from cv_bridge import CvBridge





rospy.init_node("listener", anonymous=True)
image_pubulish=rospy.Publisher('/ht/image_ht',Image,queue_size=1)
bridge = CvBridge()
'''def publish_image(imgdata):
    image_temp=Image()
    header = Header(stamp=rospy.Time.now())
    header.frame_id = 'map'
    image_temp.height=IMAGE_HEIGHT
    image_temp.width=IMAGE_WIDTH
    image_temp.encoding='rgb8'
    image_temp.data=np.array(imgdata).tostring()
    #print(imgdata)
    #image_temp.is_bigendian=True
    image_temp.header=header
    image_temp.step=4288*3
    image_pubulish.publish(image_temp)'''
'''
file_list=os.listdir('/media/htbao/xunfei/数据集制作/已制作数据集/xunfei_voc/images')
file_list.sort()
for i in file_list:
    img=cv2.imread('/media/htbao/xunfei/数据集制作/已制作数据集/xunfei_voc/images/'+i)
    publish_image(img)
    #time.sleep(1)
    cv2.imshow('123',img)
    key=cv2.waitKey(1000)
    if key==ord('q'):
        break
    print("pubulish")'''
while(True):
    img=cv2.imread('6.jpg')
    image_pubulish.publish(bridge.cv2_to_imgmsg(img, "bgr8"))
    time.sleep(1)
    #cv2.imshow('123',img)
    #key=cv2.waitKey(10000)
    #if key==ord('q'):
        #break
    print("pubulish")
