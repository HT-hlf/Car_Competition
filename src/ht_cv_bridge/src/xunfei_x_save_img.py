import cv2
import time

start=time.time()
# 打开摄像头
# /mnt/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img
img='/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x.jpg'
# cap = cv2.VideoCapture("/dev/ucar_video")
cap = cv2.VideoCapture("/dev/ucar_video")
# weight=640
# height=480
weight=1920
height=1080
codec = cv2.VideoWriter.fourcc('M', 'J', 'P', 'G')
cap.set(3, weight)
cap.set(4, height)
cap.set(cv2.CAP_PROP_FOURCC, codec)
cap.set(cv2.CAP_PROP_AUTOFOCUS, False)  # 禁止自动对焦
# cap.set(cv2.CAP_PROP_BRIGHTNESS,0.2)
# cap.set(cv2.CAP_PROP_SATURATION,0.39)
# cap.set(cv2.CAP_PROP_HUE,0.45)
# cap.set(cv2.CAP_PROP_AUTO_EXPOSURE, 0.25)
# c_15 = cap.set(cv2.CAP_PROP_EXPOSURE, 0.13)
# print(cap.get(cv2.CAP_PROP_EXPOSURE))
# c_15 = cap.set(cv2.CAP_PROP_EXPOSURE, 0.16)

if not cap.isOpened():
    print("摄像头未打开~~")
    exit()
# 逐帧捕获
res, image = cap.read()
image = cv2.flip(image,1)   ##图像左右颠倒
cv2.imwrite(img, image)
cap.release()
end=time.time()
print('{}s'.format(end-start))