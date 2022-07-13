import numpy as np
import cv2
import time
import rospy

import rospy
from std_msgs.msg import Header
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


cap = cv2.VideoCapture("/dev/ucar_video")

# c_0 =cap.get(cv2.CAP_PROP_POS_MSEC)
# c_1 =cap.get(cv2.CAP_PROP_POS_FRAMES)
# c_2 =cap.get(cv2.CAP_PROP_POS_AVI_RATIO)
# c_5=cap.get(cv2.CAP_PROP_FPS)
# c_6=cap.get(cv2.CAP_PROP_FOURCC)
# c_7=cap.get(cv2.CAP_PROP_FRAME_COUNT)
#可以改
# c_3=cap.get(cv2.CAP_PROP_FRAME_WIDTH)
# c_4=cap.get(cv2.CAP_PROP_FRAME_HEIGHT)
#亮度
# c_10=cap.get(cv2.CAP_PROP_BRIGHTNESS)
# #对比度
#c_11=cap.get(cv2.CAP_PROP_CONTRAST)
# #饱和度
# c_12=cap.get(cv2.CAP_PROP_SATURATION)
# #色相
#c_13=cap.get(cv2.CAP_PROP_HUE)
# #增益
#c_14=cap.get(cv2.CAP_PROP_GAIN)
# #曝光
# c_15=cap.get(cv2.CAP_PROP_EXPOSURE)

#亮度
# c_10=cap.set(cv2.CAP_PROP_BRIGHTNESS,0)
# #对比度
#c_11=cap.set(cv2.CAP_PROP_CONTRAST,1.5)
# #饱和度
# c_12=cap.get(cv2.CAP_PROP_SATURATION)
# #色相
# c_13=cap.set(cv2.CAP_PROP_HUE,0)
# #增益
# c_14=cap.get(cv2.CAP_PROP_GAIN)
# #曝光
# c_15=cap.set(cv2.CAP_PROP_EXPOSURE)
# cap.set(cv2.CAP_PROP_AUTO_EXPOSURE,0.25)
# c_15=cap.set(cv2.CAP_PROP_EXPOSURE,0.2)
#亮度
c_10=cap.set(cv2.CAP_PROP_BRIGHTNESS,0)
# #对比度
c_11=cap.set(cv2.CAP_PROP_CONTRAST,1)
# #饱和度
c_12=cap.set(cv2.CAP_PROP_SATURATION,0.39)
# cap.set(cv2.CAP_PROP_SHARPNESS,255)
# #色相
cap.set(cv2.CAP_PROP_HUE,0.45)
cap.set(cv2.CAP_PROP_AUTO_EXPOSURE,0.25)
c_15=cap.set(cv2.CAP_PROP_EXPOSURE,0.16)
c_15=cap.get(cv2.CAP_PROP_EXPOSURE)
# cap.set(cv2.CAP_PROP_FPS,15)
# c_5=cap.get(cv2.CAP_PROP_FPS)
# cap.set(cv2.CAP_PROP_AUTOFOCUS, True)  # 禁止自动对焦
# cap.set(cv2.CAP_PROP_SETTINGS, 1)

# c_3=cap.get(cv2.CAP_PROP_FRAME_WIDTH)
# c_3=cap.get(cv2.CAP_PROP_FRAME_WIDTH)
# print(c_0)
# print(c_1)
# print(c_2)
# print(c_3)
# print(c_4)
# print(c_5)
# print(c_6)
# print(c_7)
# print(c_10)
#print(c_11)
# print(c_12)
#print(c_13)
#print(c_14)
print(c_15)
#weight=320
#height=240
# weight=1920
# height=1080
weight=640
height=480
# value=1
cap.set(3, weight)  
#print('宽度:{}'.format(cap.get(3)))
#print(':{}'.format(cap.get(4)))
#print(':{}'.format(cap.get()))
# 设置分辨率 3和4 分别代表摄像头的属性值。你可以使用函数 cap.get(propId) 来获得视频的一些参数信息。
#这里propId 可以是 0 到 18 之间的任何整数。每一个数代表视频的一个属性,见表其中的一些值可以使用cap.set(propId,value) 
# 来修改,value 就是你想要设置成的新值。例如,我可以使用 cap.get(3) 和 cap.get(4) 来查看每一帧的宽和高。默认情况下得到的值是 640X480。
# 但是我可以使用 ret=cap.set(3,320)和 ret=cap.set(4,240) 来把宽和高改成 320X240。
cap.set(4, height)
#cap.set(10,1)
#cap.set(15,0.1)
codec = cv2.VideoWriter.fourcc('M', 'J', 'P', 'G')
# print(codec)

cap.set(cv2.CAP_PROP_FOURCC, codec)
fps =cap.get(cv2.CAP_PROP_FPS) #获取视频帧数
cap.set(cv2.CAP_PROP_AUTOFOCUS, False)  # 禁止自动对焦
cap.set(cv2.CAP_PROP_AUTOFOCUS, True)
# cap.set(cv2.CAP_PROP_SETTINGS, 1) 
b_fps=time.time()  #后帧时间全局变量赋值

rospy.init_node('ht_publish_biaoding_node', anonymous=True)  # 定义节点
image_pub = rospy.Publisher('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, queue_size=1)  # 定义话题

while(True):
    # 读取一帧
    f_fps=time.time() #前帧时间
    fps_now=str(round(1/(f_fps-b_fps),2))   #求当前帧率
    b_fps=f_fps #后帧时间
    ret, frame = cap.read()
    frame = cv2.flip(frame,1)   ##图像左右颠倒
    frame = cv2.blur(frame, (3, 3))
    cv2.putText(frame,'FPS:'+' '+fps_now,(10, 30), cv2.FONT_HERSHEY_COMPLEX_SMALL, 1 ,(0,0,255),2,cv2.LINE_AA)
    # h,w=frame.shape[:2]
    # print(h,w)
    # print("获得的帧率:",fps)
    # cv2.imshow('Camera_USB', frame)
    # if cv2.waitKey(1) & 0xFF == 27:
    #     break
    ros_frame = Image()
    header = Header(stamp=rospy.Time.now())
    header.frame_id = "Camera"
    ros_frame.header = header
    # ros_frame.width = 640
    # ros_frame.height = 480
    ros_frame.width = weight
    ros_frame.height = height
    ros_frame.encoding = "bgr8"
    ros_frame.step = 1920
    ros_frame.data = np.array(frame).tostring()  # 图片格式转换
    image_pub.publish(ros_frame)  # 发布消息
    if rospy.is_shutdown():
        raise StopIteration

cap.release()
cv2.destroyAllWindows()
