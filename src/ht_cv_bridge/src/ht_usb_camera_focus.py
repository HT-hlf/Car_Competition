import numpy as np
import cv2
import time
import rospy

import rospy
from std_msgs.msg import Header
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


cap = cv2.VideoCapture("/dev/ucar_video")

for i in range(0,11):
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
    ##清晰度
    # c_16=cap.get(cv2.CAP_PROP_SHARPNESS)

    # # 亮度
    # c_10 = cap.set(cv2.CAP_PROP_BRIGHTNESS, 0)
    # # #对比度
    # c_11 = cap.set(cv2.CAP_PROP_CONTRAST, 1)
    # # #饱和度
    # c_12 = cap.set(cv2.CAP_PROP_SATURATION, 0.39)
    # # cap.set(cv2.CAP_PROP_SHARPNESS,255)
    # # #色相
    # cap.set(cv2.CAP_PROP_HUE, 0.45)
    # # #增益
    # # c_14=cap.get(cv2.CAP_PROP_GAIN)
    # # #曝光
    # # c_15=cap.set(cv2.CAP_PROP_EXPOSURE)
    # cap.set(cv2.CAP_PROP_AUTO_EXPOSURE, 0.25)
    # # c_15=cap.set(cv2.CAP_PROP_EXPOSURE,i*0.01)
    # c_15 = cap.set(cv2.CAP_PROP_EXPOSURE, 0.16)
    weight = 1920
    height = 1080
    # weight = 640
    # height = 480
    cap.set(3, weight)
    cap.set(4, height)

    # 亮度
    c_10 = cap.set(cv2.CAP_PROP_BRIGHTNESS, 0.6)
    # #对比度
    c_11 = cap.set(cv2.CAP_PROP_CONTRAST, 1)
    # #饱和度
    c_12 = cap.set(cv2.CAP_PROP_SATURATION, 0.39)
    # cap.set(cv2.CAP_PROP_SHARPNESS,255)
    # #色相
    cap.set(cv2.CAP_PROP_HUE, 0.45)
    # #增益
    # c_14=cap.get(cv2.CAP_PROP_GAIN)
    # #曝光
    # c_15=cap.set(cv2.CAP_PROP_EXPOSURE)
    cap.set(cv2.CAP_PROP_AUTO_EXPOSURE, 0.25)
    # c_15=cap.set(cv2.CAP_PROP_EXPOSURE,i*0.01)
    c_15 = cap.set(cv2.CAP_PROP_EXPOSURE, 0.11)

    # #亮度
    # c_10=cap.set(cv2.CAP_PROP_BRIGHTNESS,0)
    # # #对比度
    # c_11=cap.set(cv2.CAP_PROP_CONTRAST,1)
    # # #饱和度
    # c_12=cap.set(cv2.CAP_PROP_SATURATION,0.39)
    # # cap.set(cv2.CAP_PROP_SHARPNESS,255)
    # # #色相
    # cap.set(cv2.CAP_PROP_HUE,0.45)
    # #增益
    # c_14=cap.get(cv2.CAP_PROP_GAIN)
    # #曝光
    # c_15=cap.set(cv2.CAP_PROP_EXPOSURE)
    # cap.set(cv2.CAP_PROP_AUTO_EXPOSURE,0.25)
    # c_15=cap.set(cv2.CAP_PROP_EXPOSURE,0.2)
    # c_15=cap.get(cv2.CAP_PROP_EXPOSURE)
    # cap.set(cv2.CAP_PROP_FPS,15)
    # c_5=cap.get(cv2.CAP_PROP_FPS)
    # cap.set(cv2.CAP_PROP_AUTOFOCUS, True)  # 禁止自动对焦
    # cap.set(cv2.CAP_PROP_SETTINGS, 1)
    # cap.set(cv2.CAP_PROP_SHARPNESS,255)

    # c_3=cap.get(cv2.CAP_PROP_FRAME_WIDTH)
    # c_3=cap.get(cv2.CAP_PROP_FRAME_WIDTH)
    # 可以改
    c_3=cap.get(cv2.CAP_PROP_FRAME_WIDTH)
    c_4=cap.get(cv2.CAP_PROP_FRAME_HEIGHT)
    # 亮度
    c_10=cap.get(cv2.CAP_PROP_BRIGHTNESS)
    #对比度
    c_11=cap.get(cv2.CAP_PROP_CONTRAST)
    #饱和度
    c_12=cap.get(cv2.CAP_PROP_SATURATION)
    #色相
    c_13=cap.get(cv2.CAP_PROP_HUE)
    #增益
    c_14=cap.get(cv2.CAP_PROP_GAIN)
    #曝光
    c_15=cap.get(cv2.CAP_PROP_EXPOSURE)
    #清晰度
    c_16=cap.get(cv2.CAP_PROP_SHARPNESS)

    # cap.set(cv2.CAP_PROP_SHARPNESS,255)

    # c_16=cap.get(cv2.CAP_PROP_SHARPNESS)

    # c_18 = cap.get(cv2.CAP_PROP_AUTOFOCUS)
    cap.set(cv2.CAP_PROP_AUTOFOCUS, 0)
    cap.set(cv2.CAP_PROP_FOCUS, i*0.1)
    c_18 = cap.get(cv2.CAP_PROP_FOCUS)
    # print(c_18)

    # print(c_0)
    # print(c_1)
    # print(c_2)
    # print(c_3)
    # print(c_4)
    # print(c_5)
    # print(c_6)
    # print(c_7)
    # print(c_10)
    # print(c_11)
    # print(c_12)
    # print(c_13)
    #print(c_14)
    # print(c_16)
    # print(c_15)
    print(c_18)
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
    # print(codec)
    # cap.set(cv2.CAP_PROP_AUTOFOCUS, False)  # 禁止自动对焦
    # cap.set(cv2.CAP_PROP_AUTOFOCUS, True)
    # cap.set(cv2.CAP_PROP_SETTINGS, 1)


    ret, frame = cap.read()
    frame = cv2.flip(frame,1)   ##图像左右颠倒
    # frame = cv2.blur(frame, (3, 3))
    cv2.putText(frame, 'WIDTH:{}'.format(c_3), (20, 35), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
    cv2.putText(frame, 'HEIGHT:{}'.format(c_4), (20, 35*2), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
    cv2.putText(frame, 'BRIGHTNESS:{}'.format(c_10), (20, 35 * 3), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
    cv2.putText(frame, 'CONTRAST:{}'.format(c_11), (20, 35 *4), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
    cv2.putText(frame, 'SATURATION:{}'.format(c_12), (20, 35 *5), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
    cv2.putText(frame, 'HUE:{}'.format(c_13), (20, 35 *6), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
    cv2.putText(frame, 'GAIN:{}'.format(c_14), (20, 35 *7), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
    cv2.putText(frame, 'EXPOSURE:{}'.format(c_15), (20, 35 *8), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
    cv2.putText(frame, 'SHARPNESS:{}'.format(c_16), (20, 35*9), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
    cv2.putText(frame, 'FOCUS:{}'.format(c_18), (20, 35 * 10), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
    cv2.imwrite('focus/focus:{}.png'.format(c_18), frame)
    # cv2.imwrite('ht.png', frame)


cap.release()
cv2.destroyAllWindows()
