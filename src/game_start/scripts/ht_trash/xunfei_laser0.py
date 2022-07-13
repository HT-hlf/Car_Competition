# coding:utf-8

import rospy
import cv2
import numpy as np
import math

from sensor_msgs.msg import LaserScan
car_x,car_y=25,125
new_people_th=10
map_people_th=15
list_num1_th=4
car_people_distance=67


x_map=-0.7
y_map=-4.35
x_wm=0.425
y_wm=0.450
def rpy2quar(r,p,y):
    sinp = math.sin(math.radians(p / 2))
    siny = math.sin(math.radians(y / 2))
    sinr = math.sin(math.radians(r / 2))

    cosp = math.cos(math.radians(p / 2))
    cosy = math.cos(math.radians(y / 2))
    cosr = math.cos(math.radians(r / 2))

    w = cosr * cosp * cosy + sinr * sinp * siny
    x = sinr * cosp * cosy - cosr * sinp * siny
    y = cosr * sinp * cosy + sinr * cosp * siny
    z = cosr * cosp * siny - sinr * sinp * cosy
    return x,y,z,w
# def point_car_distance(x):
#
#
# def point_select(result_list):
#
#     select_result_list=[]
#
#     return select_result_list
def listener():
    # rospy.init_node('ht_laser_listener')
    # frame = np.zeros((400, 400, 3), np.uint8)
    # frame1 = np.zeros((400, 400, 3), np.uint8)
    # rospy.sleep(2)
    sum_people_list = []
    people_list = []
    result_list=[]
    select_result_list=[]
    data = rospy.wait_for_message("/scan", LaserScan,timeout=None)
    angle_new = data.angle_min + (85.0 * math.pi / 180.0)
    for r in data.ranges:


        if math.isinf(r) == True:
            r = 0
        x = math.trunc((r * 100) * math.cos(angle_new))
        y = math.trunc((r * 100) * math.sin(angle_new))


        if y > 500 or y < -500 or x < -500 or x > 500:
            x = 0
            y = 0

        abs_x = x + car_x
        abs_y = y + car_y
        if abs_x < map_people_th or abs_x > 150-map_people_th or abs_y > 250 or abs_y < car_y:
            abs_x = car_x
            abs_y = car_y
        elif abs_x != 25 and abs_y != 175:
            # print(abs_x ,abs_y)
            list_num = len(people_list)
            if list_num != 0 and math.sqrt((people_list[list_num - 1][0] - abs_x) ** 2 + (
                    people_list[list_num - 1][1] - abs_y) ** 2) > new_people_th:
                sum_people_list.append(people_list)
                # print('True')
                # print(people_list)
                people_list = []
            people_list.append((abs_x, abs_y))

        angle_new = angle_new + data.angle_increment


    sum_people_list.append(people_list)
    # print(sum_people_list)
    for list in sum_people_list:

        list_num1 = len(list)
        if list_num1 > list_num1_th:

            np_list = np.array(list)
            line = cv2.fitLine(np_list, cv2.DIST_L2, 0, 0.01, 0.01)


            x_last = line[2][0] - car_people_distance * line[1][0]
            y_last = line[3][0] + car_people_distance * line[0][0]
            x_last1 = line[2][0] + car_people_distance * line[1][0]
            y_last1 = line[3][0] - car_people_distance * line[0][0]

            car_point_d2 = (x_last - car_x) ** 2 + (y_last - car_y) ** 2
            car_point_d2_1 = (x_last1 - car_x) ** 2 + (y_last1 - car_y) ** 2

            if car_point_d2_1 < car_point_d2:
                x_last = x_last1
                y_last = y_last1


            people_degree=math.degrees(math.atan2(-(y_last-line[3][0]), -(x_last-line[2][0])))
            quar_x,quar_y,quar_z,quar_w=rpy2quar(0, 0, people_degree)


            x_last_map=x_last/100+x_wm+x_map
            y_last_map = y_last / 100 + y_wm + y_map



            # print(x_last_map,y_last_map)
            # print(x_last_map1, y_last_map1)
            # print('x:{},y:{},z:0.000,x:{},y:{},z:{},w:{}'.format(x_last_map ,y_last_map,quar_x,quar_y,quar_z,quar_w))
            result_list.append([[x_last_map ,y_last_map,0],[quar_x,quar_y,quar_z,quar_w],car_point_d2])
            # result_list.append([x_last_map ,y_last_map,0,quar_x,quar_y,quar_z,quar_w])



    for result in sorted(result_list,key=lambda x:x[2]):
        select_result_list.append(result[0:2])
        print(result[2])




    return select_result_list


            # if car_point_d2_1<car_point_d2:
            #     result_list.append([x_last_map1, y_last_map1,0.000])
            #     result_list.append([x_last_map, y_last_map,0.000])
            # else:
            #     result_list.append([x_last_map, y_last_map,0.000])
            #     result_list.append([x_last_map1, y_last_map1,0.000])




            # print('x_last',x_last)
            # print('y_last', y_last)
            # print('x_last1', x_last1)
            # print('y_last1', y_last1)





            # cv2.circle(frame1, (int(x_last), int(y_last)), 6, (0, 0, 255))
            # cv2.circle(frame1, (int(x_last1), int(y_last1)), 6, (0, 0, 255))

            # ptStart = (0, int(y))
            # ptEnd = (int(line[2][0]), int(line[3][0]))
            #
            # ptStart1 = (0, int(y1))
            # ptEnd1 = (int(line[2][0]), int(line[3][0]))

            # print(ptStart)
            # print(ptEnd)
            # point_color = (0, 255, 0)  # BGR
            # thickness = 1
            # lineType = 4
            # cv2.line(frame1, ptStart, ptEnd, point_color, thickness, lineType)
            # cv2.line(frame1, ptStart1, ptEnd1, point_color, thickness, lineType)

            # print()

    # cv2.imshow('frame1', frame1)
    # cv2.imshow('frame', frame)
    # cv2.waitKey(0)


#
# if __name__ == '__main__':
#     print(listener())