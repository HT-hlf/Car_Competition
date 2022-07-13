#encoding=UTF-8
import cv2
import numpy as np
import cv2.aruco as aruco
import time
output='ht_1280e_15.mp4'


def ht_aruco():
    cap = cv2.VideoCapture("/dev/ucar_video")
    # weight = 1920
    # height = 1080
    # weight = 1280
    # height = 720
    weight = 640
    height = 480
    cap.set(3, weight)
    cap.set(4, height)
    # 可以改
    # c_3=cap.get(cv2.CAP_PROP_FRAME_WIDTH)
    # c_4=cap.get(cv2.CAP_PROP_FRAME_HEIGHT)
    # 亮度
    # c_10 = cap.get(cv2.CAP_PROP_BRIGHTNESS)
    # #对比度
    # c_11=cap.get(cv2.CAP_PROP_CONTRAST)
    # #饱和度
    # c_12=cap.get(cv2.CAP_PROP_SATURATION)
    # #色相
    # c_13=cap.get(cv2.CAP_PROP_HUE)
    # #增益
    # c_14=cap.get(cv2.CAP_PROP_GAIN)
    # #曝光
    # c_15=cap.get(cv2.CAP_PROP_EXPOSURE)

    # 亮度
    c_10 = cap.set(cv2.CAP_PROP_BRIGHTNESS, 0.7)
    # #对比度
    c_11 = cap.set(cv2.CAP_PROP_CONTRAST, 1)
    # #饱和度
    c_12 = cap.set(cv2.CAP_PROP_SATURATION, 0.39)
    # cap.set(cv2.CAP_PROP_SHARPNESS,255)
    # #色相
    cap.set(cv2.CAP_PROP_HUE, 0.45)
    cap.set(cv2.CAP_PROP_AUTO_EXPOSURE, 0.25)
    c_15 = cap.set(cv2.CAP_PROP_EXPOSURE, 0.12)
    c_15 = cap.get(cv2.CAP_PROP_EXPOSURE)
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
    # print(c_11)
    # print(c_12)
    # print(c_13)
    # print(c_14)
    print('c_15',c_15)
    fourcc = cv2.VideoWriter_fourcc(*'mp4v')  # 视频编解码器
    fps = cap.get(cv2.CAP_PROP_FPS)  # 帧数
    width, height = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH)), int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))  # 宽高
    out = cv2.VideoWriter(output, fourcc, fps, (width, height))  # 写入视频
    ht_aruco_list=[]

    b_fps = time.time()  # 后帧时间全局变量赋值

    for i in range(12000):
        # get a frame
        # 读取一帧
        f_fps = time.time()  # 前帧时间

        fps_now = str(round(1 / (f_fps - b_fps), 2))  # 求当前帧率
        b_fps = f_fps  # 后帧时间
        ret, frame = cap.read()
        print(fps_now)
        # print(frame.shape)
        # cv2.putText(frame, 'FPS:' + ' ' + fps_now, (10, 70), cv2.FONT_HERSHEY_COMPLEX_SMALL, 1, (0, 0, 255), 2,
        #             cv2.LINE_AA)
        #frame = cv2.flip(frame,1)   ##图像左右颠倒
        # show a frame
        # cv2.imshow("capture", frame)
        # img_gray = cv2.cvtColor(frame, cv2.COLOR_RGB2GRAY)
        # print(img.shape)
        # aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_4X4_100)
        # corners, ids, _ = aruco.detectMarkers(img_gray, aruco_dict)
        # frame = cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)
        # print('corners',corners)
        # print('ids', type(ids))
        # aruco.drawDetectedMarkers(frame, corners, ids)
        # if ids is not None:
        #     for i in range(len(ids)):
        #         print('find aruco:', ids[i][0])
        #         ht_aruco_list.append(ids[i][0])
        #         cv2.putText(frame, 'aruco:{}'.format(ids[i]), (20, 35*(i+1)), 0, 1, [0, 255, 0], thickness=2, lineType=cv2.LINE_AA)
        #         #cv2.waitKey(0)
        #         #cv2.destroyAllWindows()
        # else:
        #     pass
        #     cv2.putText(frame, 'no aruco'.format(0), (20, 35), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
        # cv2.imshow('Detected AruCo markers', frame)
        out.write(frame)  # 写入帧
        # cv2.waitKey(1)
        # cv2.destroyAllWindows()
        # if cv2.waitKey(1) & 0xFF == ord('q'):
        #     break
    # if len(ht_aruco_list)!=0:
    #     ht_aruco_list_array=np.array(ht_aruco_list)
    #     ht_aruco_num=np.median(ht_aruco_list_array)
    # else:
    #     ht_aruco_num=-1
    cap.release()
    out.release()
    # cv2.destroyAllWindows()
    # print(ht_aruco_list)
    # print(ht_aruco_list_array)
    # print(ht_aruco_num)
    # print('final find aruco:{}'.format(int(ht_aruco_num)))
    # return int(ht_aruco_num)
# print(ht_aruco_list)
ht_aruco()
# print('final find aruco:{}'.format(ht_aruco()))


