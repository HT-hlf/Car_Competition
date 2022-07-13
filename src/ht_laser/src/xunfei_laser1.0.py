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
car_people_distance=40


x_map=-0.7
y_map=-4.35
x_wm=0.425
y_wm=0.450
def rpy2quar(r,p,y):
    # r = float(input("绕x轴旋转角度:"))
    # p = float(input("绕y轴旋转角度:"))
    # y = float(input("绕z轴旋转角度:"))
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
def listener():
    rospy.init_node('ht_laser_listener')
    # frame = np.zeros((400, 400, 3), np.uint8)
    # frame1 = np.zeros((400, 400, 3), np.uint8)
    # rospy.sleep(2)
    sum_people_list = []
    people_list = []
    result_list=[]
    data = rospy.wait_for_message("/scan", LaserScan,timeout=None)
    angle_new = data.angle_min + (85.0 * math.pi / 180.0)
    for r in data.ranges:


        if math.isinf(r) == True:
            r = 0

        # convert angle and radius to cartesian coordinates
        # 这里就是将极坐标的信息转为直角坐标信息，只是像素的转化，不对应具体值
        # 如果x中的90是正的，则顺时针显示，如果是负的，则逆时针显示。
        # x = math.trunc((r)*math.cos(angle))
        # y = math.trunc((r)*math.sin(angle))
        # x = math.trunc((r*200) * math.cos(angle + (-86.0 * 3.1416 / 180.0)))
        # y = math.trunc((r*200) * matlmgggh.sin(angle + (-86.0 * 3.1416 / 180.0)))
        x = math.trunc((r * 100) * math.cos(angle_new))
        y = math.trunc((r * 100) * math.sin(angle_new))
        # x = math.trunc((r * 200) * math.cos(angle))
        # y = math.trunc((r * 200) * math.sin(angle))

        # x = math.trunc((r * 100) * math.cos(angle))
        # y = math.trunc((r * 100) * math.sin(angle))

        # print('x:{}'.format(x))
        # print('y:{}'.format(y))

        # set the borders (all values outside the defined area should be 0)
        # 设置限度，基本上不设置也没关系了
        if y > 500 or y < -500 or x < -500 or x > 500:
            x = 0
            y = 0
        # if y > 600 :
        #     y=599
        # elif y<0:
        #     y=1
        # else:
        #     pass
        # if x > 600 :
        #     x=599
        # elif x<0:
        #     x=1
        # else:
        #     pass
        # print "xy:",x,y
        # 用CV2画线，位置在(300,300),和目标点，颜色是(255,0,0),线宽2

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
        # cv2.line(frame, (car_x, car_y), (abs_x, abs_y), (0, 255, 0), 2)
        # cv2.circle(frame, (abs_x, abs_y), 6, (255, 0, 0), -2)
        # 角度得增加
        # angle= angle - data.angle_increment
        angle_new = angle_new + data.angle_increment
        # 画个中心圆
        # cv2.circle(frame, (car_x, car_y), 6, (0, 0, 255))
        # cv2.circle(frame, (car_x, car_y), 6, (0, 0, 255))
        # 腐蚀膨胀
        # erode = cv2.erode(frame, None, iterations=2)
        # cv2.imshow('erode', erode)
        # dilate = cv2.dilate(erode, None, iterations=2)
        # cv2.imshow('frame', frame)
        # cv2.waitKey(1)
    # print('finish')
    sum_people_list.append(people_list)
    # print(sum_people_list)
    for list in sum_people_list:

        list_num1 = len(list)
        if list_num1 > list_num1_th:
            # print('ht')
            x_c = (list[0][0] + list[list_num1 - 1][0]) / 2
            y_c = (list[0][1] + list[list_num1 - 1][1]) / 2
            # cv2.circle(frame1, (int(x_c), int(y_c)), 6, (0, 0, 255))
            np_list = np.array(list)
            line = cv2.fitLine(np_list, cv2.DIST_L2, 0, 0.01, 0.01)
            # [[cos  a],[sin a],[point_x],[point_y]]
            # k = line[1][0] / line[0][0]
            # y = k * (0 - line[2][0]) + line[3][0]
            # x = 0
            # # print(line)
            #
            # k1 = -line[0][0] / line[1][0]
            # y1 = k1 * (0 - line[2][0]) + line[3][0]
            # x1 = 0

            x_last = line[2][0] - car_people_distance * line[1][0]
            y_last = line[3][0] + car_people_distance * line[0][0]
            x_last1 = line[2][0] + car_people_distance * line[1][0]
            y_last1 = line[3][0] - car_people_distance * line[0][0]

            car_point_d2 = (x_last - car_x) ** 2 + (y_last - car_y) ** 2
            car_point_d2_1 = (x_last1 - car_x) ** 2 + (y_last1 - car_y) ** 2

            if car_point_d2_1 < car_point_d2:
                x_last = x_last1
                y_last = y_last1

            # print('angle',math.degrees(math.atan2(-(y_last-line[3][0]), -(x_last-line[2][0]))))
            people_degree=math.degrees(math.atan2(-(y_last-line[3][0]), -(x_last-line[2][0])))
            quar_x,quar_y,quar_z,quar_w=rpy2quar(0, 0, people_degree)


            x_last_map=x_last/100+x_wm+x_map
            y_last_map = y_last / 100 + y_wm + y_map
            # rpy2quar(0, 0, )

            # x_last_map1 = x_last / 100 + x_wm + x_map
            # y_last_map1 = y_last / 100 + y_wm + y_map

            # print(x_last_map,y_last_map)
            # print(x_last_map1, y_last_map1)
            # print('x:{},y:{},z:0.000,x:{},y:{},z:{},w:{}'.format(x_last_map ,y_last_map,quar_x,quar_y,quar_z,quar_w))
            result_list.append([x_last_map ,y_last_map,0,quar_x,quar_y,quar_z,quar_w])

    return result_list


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



# if __name__ == '__main__':
#     print(listener())