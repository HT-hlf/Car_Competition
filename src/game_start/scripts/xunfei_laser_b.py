# coding:utf-8

import rospy
import cv2
import numpy as np
import math

from sensor_msgs.msg import LaserScan
#[[-0.025, -2.60, 0.000],[0.000, 0.000, 0.70710678, 0.70710678]]
real_car_x,real_car_y=-0.025,-2.60
new_people_th=8
map_people_th_x=12
map_people_th_y=1
map_people_th_y1=12
list_num1_th=4
car_people_distance=60

map_people_th_x_1=15
map_people_th_y_1=4
map_people_th_y1_1=15



# laser_x,laser_y=29,105
laser_x,laser_y=29,108


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
    # correct_list = []
    # for r in data.ranges:
    #     if math.isinf(r) == True:
    #         r = 0
    #     if 140 <= angle_new / math.pi * 180 <= 220 and r != 0:
    #         x = math.trunc((r * 100) * math.cos(angle_new))
    #         y = math.trunc((r * 100) * math.sin(angle_new))
    #         correct_list.append((x , y ))
    #     angle_new = angle_new + data.angle_increment
    # np_list = np.array(correct_list)
    # correct_line = cv2.fitLine(np_list, cv2.DIST_L2, 0, 0.01, 0.01)
    # correct_degree = math.degrees(math.atan2(correct_line[1][0], correct_line[0][0]))
    # if 0 <= correct_degree <= 90:
    #     correct_angle = math.pi / 2 - math.atan2(correct_line[1][0], correct_line[0][0])
    #     # correct_angle = 90 - correct_degree
    # elif -90 < correct_degree < 0:
    #     correct_angle = -math.pi / 2 - math.atan2(correct_line[1][0], correct_line[0][0])
    #
    #     # correct_angle = -90 - correct_degree
    # else:
    #     print('出错')
    # if -math.pi/6<=correct_angle<=math.pi/6:
    #     angle_new = data.angle_min + (85.0 * math.pi / 180.0)+correct_angle
    #     print('jiaozhen_dushu:',correct_angle/math.pi *180.0)
    # else:
    #     print('jiaozhen_wrong')
    for r in data.ranges:

        if math.isinf(r) == True:
            r = 0
        x = math.trunc((r * 100) * math.cos(angle_new))
        y = math.trunc((r * 100) * math.sin(angle_new))

        if y > 400 or y < -400 or x < -400 or x > 400:
            x = 0
            y = 0

        abs_x = x + laser_x
        abs_y = y + laser_y
        if abs_x < map_people_th_x or abs_x > 150 - map_people_th_x or abs_y > 250 - map_people_th_y or abs_y < 100 + map_people_th_y1:
            abs_x = laser_x
            abs_y = laser_y
        elif abs_x != laser_x and abs_y != laser_y:
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
        #这里可以设置过滤

        list_num1 = len(list)
        if list_num1 > list_num1_th:

            np_list = np.array(list)
            line = cv2.fitLine(np_list, cv2.DIST_L2, 0, 0.01, 0.01)


            x_last = line[2][0] - car_people_distance * line[1][0]
            y_last = line[3][0] + car_people_distance * line[0][0]
            x_last1 = line[2][0] + car_people_distance * line[1][0]
            y_last1 = line[3][0] - car_people_distance * line[0][0]
            print('y_last',y_last)
            print('y_last1',y_last1 )
            if (map_people_th_x_1<x_last1<150-map_people_th_x_1 and 100+map_people_th_y1_1<y_last1 <250-map_people_th_y_1) or (map_people_th_x_1<x_last<150-map_people_th_x_1 and 100+map_people_th_y1_1<y_last <250-map_people_th_y_1):
                car_point_d2 = (x_last - laser_x) ** 2 + (y_last - laser_y) ** 2
                car_point_d2_1 = (x_last1 - laser_x) ** 2 + (y_last1 - laser_y) ** 2
                if not (map_people_th_x_1 < x_last1 < 150 - map_people_th_x_1 and 100 + map_people_th_y1_1 < y_last1 < 250 - map_people_th_y_1):
                    x_person = x_last
                    y_person = y_last
                    print(1)
                elif not (map_people_th_x_1 < x_last < 150 - map_people_th_x_1 and 100 + map_people_th_y1_1 < y_last < 250 - map_people_th_y_1):
                    x_person = x_last1
                    y_person = y_last1
                    print(2)
                else:
                    if car_point_d2_1 < car_point_d2:
                        x_person = x_last1
                        y_person = y_last1
                        print(3)
                    else:
                        x_person = x_last
                        y_person = y_last
                        print(4)
                people_degree = math.degrees(math.atan2(-(y_person - line[3][0]), -(x_person - line[2][0])))
                quar_x, quar_y, quar_z, quar_w = rpy2quar(0, 0, people_degree)

                # x_last_map = x_person / 100 + x_wm + x_map
                # y_last_map = y_person / 100 + y_wm + y_map
                x_last_map = real_car_x+(x_person-laser_x) / 100
                y_last_map = real_car_y+(y_person -laser_y )/100

                # print(x_last_map,y_last_map)
                # print(x_last_map1, y_last_map1)
                # print('x:{},y:{},z:0.000,x:{},y:{},z:{},w:{}'.format(x_last_map ,y_last_map,quar_x,quar_y,quar_z,quar_w))
                result_list.append([[x_last_map, y_last_map, 0], [quar_x, quar_y, quar_z, quar_w], car_point_d2])

    if len(result_list)!=0:
        for result in sorted(result_list,key=lambda x:x[2]):
            select_result_list.append(result[0:2])
            # print(result[2])



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


# #
# if __name__ == '__main__':
#     print(listener())