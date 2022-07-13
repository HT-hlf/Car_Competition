#encoding=UTF-8
import cv2
import numpy as np
import cv2.aruco as aruco
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import rospy
output='ht_aruco.mp4'


def ht_aruco():
    # cap = cv2.VideoCapture(0)
    rospy.init_node('ht_receive')
    fourcc = cv2.VideoWriter_fourcc(*'mp4v')  # 视频编解码器
    # fps = cap.get(cv2.CAP_PROP_FPS)  # 帧数
    fps = 15
    print(1)
    data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
    # width, height = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH)), int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))  # 宽高
    width, height = int(data.width), int(data.height)  # 宽高
    out = cv2.VideoWriter(output, fourcc, fps, (width, height))  # 写入视频
    ht_aruco_list=[]
    bridge = CvBridge()
    for i in range(15):
        # get a frame
        # ret, frame = cap.read()
        #frame = cv2.flip(frame,1)   ##图像左右颠倒
        # show a frame
        # cv2.imshow("capture", frame)
        data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
        frame = bridge.imgmsg_to_cv2(data, "bgr8")
        img_gray = cv2.cvtColor(frame, cv2.COLOR_RGB2GRAY)
        # print(img.shape)
        aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_4X4_100)
        corners, ids, _ = aruco.detectMarkers(img_gray, aruco_dict)
        # frame = cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)
        # print('corners',corners)
        # print('ids', type(ids))
        aruco.drawDetectedMarkers(frame, corners, ids)
        if ids is not None:
            for i in range(len(ids)):
                print('find aruco:', ids[i][0])
                ht_aruco_list.append(ids[i][0])
                cv2.putText(frame, 'aruco:{}'.format(ids[i]), (20, 35*(i+2)), 0, 1, [0, 255, 0], thickness=2, lineType=cv2.LINE_AA)
                #cv2.waitKey(0)
                #cv2.destroyAllWindows()
        else:
            pass
            cv2.putText(frame, 'no aruco'.format(0), (20, 70), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
        # cv2.imshow('Detected AruCo markers', frame)
        out.write(frame)  # 写入帧
        # cv2.waitKey(1)
        # cv2.destroyAllWindows()
        # if cv2.waitKey(1) & 0xFF == ord('q'):
        #     break
    if len(ht_aruco_list)!=0:
        ht_aruco_list_array=np.array(ht_aruco_list)
        ht_aruco_num=np.median(ht_aruco_list_array)
    else:
        ht_aruco_num=-1
    # cap.release()
    out.release()
    # cv2.destroyAllWindows()
    # print(ht_aruco_list)
    # print(ht_aruco_list_array)
    # print(ht_aruco_num)
    print('final find aruco:{}'.format(int(ht_aruco_num)))
    return int(ht_aruco_num)
# print(ht_aruco_list)
print('final find aruco:{}'.format(ht_aruco()))


