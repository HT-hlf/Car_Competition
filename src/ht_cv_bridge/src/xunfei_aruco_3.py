#encoding=UTF-8

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
import cv2.aruco as aruco
import numpy as np



def ht_aruco():
    bridge = CvBridge()
    ht_aruco_list = []
    for i in range(6):
        # frame=listener()
        rospy.init_node('ht_img_sub')
        data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
        frame = bridge.imgmsg_to_cv2(data, "bgr8")
        img_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        aruco_dict = aruco.Dictionary_get(aruco.DICT_4X4_250)
        parameters = aruco.DetectorParameters_create()
        corners, ids, _ = aruco.detectMarkers(img_gray, aruco_dict,parameters=parameters)
        # aruco.drawDetectedMarkers(frame, corners, ids)
        if ids is not None:
            for i in range(len(ids)):
                print('find aruco:', ids[i][0])
                ht_aruco_list.append(ids[i][0])
                # cv2.putText(frame, 'aruco:{}'.format(ids[i]), (20, 35 * (i + 2)), 0, 1, [0, 255, 0], thickness=2,
                #             lineType=cv2.LINE_AA)
                # cv2.waitKey(0)
                # cv2.destroyAllWindows()
        # else:
        #     pass
            # cv2.putText(frame, 'no aruco'.format(0), (20, 70), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
        # cv2.imshow('Detected AruCo markers', frame)
        # out.write(frame)  # 写入帧
        if len(ht_aruco_list) != 0:
            ht_aruco_list_array = np.array(ht_aruco_list)
            ht_aruco_num = np.median(ht_aruco_list_array)
        else:
            ht_aruco_num = -1
    # out.release()
    print('final find aruco:{}'.format(int(ht_aruco_num)))
    return int(ht_aruco_num)

ht_aruco()
