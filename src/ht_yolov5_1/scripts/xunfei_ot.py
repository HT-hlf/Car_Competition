#! /usr/bin/env python3

import torch
import numpy as np
import torch.backends.cudnn as cudnn
import time
from pathlib import Path
from numpy import random
import cv2

from utils.datasets import LoadImages
from utils.torch_utils import time_synchronized,select_device
from utils.general import non_max_suppression,scale_coords,xyxy2xywh,increment_path, set_logging,check_img_size
from utils.plots import plot_one_box
from models.experimental import attempt_load

#ROS
import rospy
from sensor_msgs.msg import Image
from std_msgs.msg import Header
IMAGE_WIDTH=1241
IMAGE_HEIGHT=376
ros_image = 0
def image_callback_1(image):
    global ros_image
    #image 应该是一个结构体
    #print(image.height, image.width)
    ros_image = np.frombuffer(image.data, dtype=np.uint8).reshape(image.height, image.width, -1)
    with torch.no_grad():
        detect(ros_image)
def detect(img):
    save_txt = False
    view_img = False
    save_conf = False

    project = 'runs/detect'
    name = 'exp'
    exist_ok = False

    augment = False
    conf_thres = 0.5
    iou_thres = 0.45
    classes = None
    agnostic_nms = False
    save_img = True
    #imgsz = 416


    # Directories
    save_dir = Path(increment_path(Path(project) / name, exist_ok=exist_ok))  # increment run
    # save_dir = '/media/htbao/KINGIDISK/G-讯飞智能餐厅/yolov5-ros/bug/save_dir'  # increment run
    (save_dir+'labels' if save_txt else save_dir).mkdir(parents=True, exist_ok=True)  # make dir

    # Second-stage classifier
    # classify = False
    # if classify:
    #     modelc = load_classifier(name='resnet101', n=2)  # initialize
    #     modelc.load_state_dict(torch.load('weights/resnet101.pt', map_location=device)['model']).to(device).eval()

    # Set Dataloader
    vid_path, vid_writer = None, None
    # if webcam:
    #     view_img = True
    cudnn.benchmark = True  # set True to speed up constant image size inference
        # dataset = LoadStreams(source, img_size=imgsz)
    # else:
    save_img = True
    #这个imgsz是可以用main的吗
    #巨坑
    #dataset = LoadImages(img, img_size=imgsz)
    dataset = loadimg(img)

    # Get names and colors
    names = model.module.names if hasattr(model, 'module') else model.names
    #colors = [[random.randint(0, 255) for _ in range(3)] for _ in names]
    colors = [[0,0,255],[0,255,0],[255,0,0]]



    # Run inference
    t0 = time.time()
    img = torch.zeros((1, 3, imgsz, imgsz), device=device)  # init img
    _ = model(img.half() if half else img) if device.type != 'cpu' else None  # run once

    path = dataset[0]
    img = dataset[1]
    im0s = dataset[2]
    vid_cap = dataset[3]

    #path具体是什么
    # for path, img, im0s, vid_cap in dataset:
    img = torch.from_numpy(img).to(device)
    img = img.half() if half else img.float()  # uint8 to fp16/32
    img /= 255.0  # 0 - 255 to 0.0 - 1.0
    if img.ndimension() == 3:
        img = img.unsqueeze(0)

    # Inference
    t1 = time_synchronized()
    pred = model(img, augment=augment)[0]

    # Apply NMS
    pred = non_max_suppression(pred, conf_thres, iou_thres, classes=classes, agnostic=agnostic_nms)
    t2 = time_synchronized()

    # # Apply Classifier
    # if classify:
    #     pred = apply_classifier(pred, modelc, img, im0s)

    # Process detections
    for i, det in enumerate(pred):  # detections per image
        # if webcam:  # batch_size >= 1
        #     p, s, im0, frame = path[i], '%g: ' % i, im0s[i].copy(), dataset.count
        # else:
        # p, s, im0, frame = path, '', im0s, getattr(dataset, 'frame', 0)
        p, s, im0= path, '', im0s

        #p = Path(p)  # to Path
        #save_path = str(save_dir / p.name)  # img.jpg
        #txt_path = str(save_dir / 'labels' / p.stem) + ('' if dataset.mode == 'image' else f'_{frame}')  # img.txt

        save_path = '/media/htbao/KINGIDISK/G-讯飞智能餐厅/yolov5-ros/bug/save_path'
        txt_path = '/media/htbao/KINGIDISK/G-讯飞智能餐厅/yolov5-ros/bug/txt_path'

        s += '%gx%g ' % img.shape[2:]  # print string
        gn = torch.tensor(im0.shape)[[1, 0, 1, 0]]  # normalization gain whwh
        if len(det):
            # Rescale boxes from img_size to im0 size
            det[:, :4] = scale_coords(img.shape[2:], det[:, :4], im0.shape).round()

            # Print results
            for c in det[:, -1].unique():
                n = (det[:, -1] == c).sum()  # detections per class
                s += f'{n} {names[int(c)]}s, '  # add to string

            # Write results
            count_0=0
            count_1 = 0
            count_2 = 0
            count_3 = 0
            for *xyxy, conf, cls in reversed(det):
                if save_txt:  # Write to file
                    xywh = (xyxy2xywh(torch.tensor(xyxy).view(1, 4)) / gn).view(-1).tolist()  # normalized xywh
                    line = (cls, *xywh, conf) if save_conf else (cls, *xywh)  # label format
                    with open(txt_path + '.txt', 'a') as f:
                        f.write(('%g ' * len(line)).rstrip() % line + '\n')

                if save_img or view_img:  # Add bbox to image
                    #DIY
                    if int(cls)==0:
                        count_0+=1
                    elif int(cls)==1:
                        count_1+=1
                    elif int(cls)==2:
                        count_2+=1
                    else:
                        count_3+=1
                    label = f'{names[int(cls)]} {conf:.2f}'
                    plot_one_box(xyxy, im0, label=label, color=colors[int(cls)], line_thickness=2)
            cv2.putText(im0, 'Kuka_YouBot:{}'.format(count_0), (20,35), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
            cv2.putText(im0, 'TurtleBot:{}'.format(count_1), (20, 70), 0, 1, [0, 255, 0], thickness=2,
                        lineType=cv2.LINE_AA)
            cv2.putText(im0, 'Pioneer_3AT:{}'.format(count_2), (20, 105), 0, 1, [225, 0, 0], thickness=2,
                        lineType=cv2.LINE_AA)
            #cv2.putText(img, label, (c1[0], c1[1] - 2), 0, tl / 3, [225, 255, 255], thickness=tf, lineType=cv2.LINE_AA)
        else:
            cv2.putText(im0, 'Kuka_YouBot:{}'.format(0), (20, 35), 0, 1, [0, 0, 255], thickness=2,
                        lineType=cv2.LINE_AA)
            cv2.putText(im0, 'TurtleBot:{}'.format(0), (20, 70), 0, 1, [0, 255, 0], thickness=2,
                        lineType=cv2.LINE_AA)
            cv2.putText(im0, 'Pioneer_3AT:{}'.format(0), (20, 105), 0, 1, [225, 0, 0], thickness=2,
                        lineType=cv2.LINE_AA)
        #Print time (inference + NMS)
        # print(f'{s}Done. ({t2 - t1:.3f}s)')

        # Stream results
        if view_img:
            cv2.imshow(str(p), im0)
            # cv2.waitKey(1)

        # Save results (image with detections)
        # if save_img:
            # if dataset.mode == 'image':
            # cv2.imwrite(save_path, im0)
            # else:  # 'video'
            #     if vid_path != save_path:  # new video
            #         vid_path = save_path
            #         if isinstance(vid_writer, cv2.VideoWriter):
            #             vid_writer.release()  # release previous video writer
            #
            #         fourcc = 'mp4v'  # output video codec
            #         fps = vid_cap.get(cv2.CAP_PROP_FPS)
            #         w = int(vid_cap.get(cv2.CAP_PROP_FRAME_WIDTH))
            #         h = int(vid_cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
            #         vid_writer = cv2.VideoWriter(save_path, cv2.VideoWriter_fourcc(*fourcc), fps, (w, h))
            #     vid_writer.write(im0)


    # if save_txt or save_img:
    #     s = f"\n{len(list(save_dir.glob('labels/*.txt')))} labels saved to {save_dir / 'labels'}" if save_txt else ''
    #     print(f"Results saved to {save_dir}{s}")

    # print(f'Done. ({time.time() - t0:.3f}s)')
    #应该是rgb to bgr
        out_img = im0[:, :, [2, 1, 0]]
        ros_image = out_img
        cv2.imshow('YOLOV5', out_img)
        a = cv2.waitKey(1)
    #创建了compress？？？
    #### Create CompressedIamge ####
    publish_image(im0)

def publish_image(imgdata):
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
    image_temp.step=1241*3
    image_pub.publish(image_temp)
def loadimg(img):  # 接受opencv图片
    img_size=640
    cap=None
    path=None
    img0 = img
    img = letterbox(img0, new_shape=img_size)[0]
    img = img[:, :, ::-1].transpose(2, 0, 1)  # BGR to RGB, to 3x416x416
    img = np.ascontiguousarray(img)
    return path, img, img0, cap
def letterbox(img, new_shape=(640, 640), color=(114, 114, 114), auto=True, scaleFill=False, scaleup=True):
    # Resize image to a 32-pixel-multiple rectangle https://github.com/ultralytics/yolov3/issues/232
    shape = img.shape[:2]  # current shape [height, width]
    if isinstance(new_shape, int):
        new_shape = (new_shape, new_shape)

    # Scale ratio (new / old)
    r = min(new_shape[0] / shape[0], new_shape[1] / shape[1])
    if not scaleup:  # only scale down, do not scale up (for better test mAP)
        r = min(r, 1.0)

    # Compute padding
    ratio = r, r  # width, height ratios
    new_unpad = int(round(shape[1] * r)), int(round(shape[0] * r))
    dw, dh = new_shape[1] - new_unpad[0], new_shape[0] - new_unpad[1]  # wh padding
    if auto:  # minimum rectangle
        dw, dh = np.mod(dw, 32), np.mod(dh, 32)  # wh padding
    elif scaleFill:  # stretch
        dw, dh = 0.0, 0.0
        new_unpad = (new_shape[1], new_shape[0])
        ratio = new_shape[1] / shape[1], new_shape[0] / shape[0]  # width, height ratios

    dw /= 2  # divide padding into 2 sides
    dh /= 2

    if shape[::-1] != new_unpad:  # resize
        img = cv2.resize(img, new_unpad, interpolation=cv2.INTER_LINEAR)
    top, bottom = int(round(dh - 0.1)), int(round(dh + 0.1))
    left, right = int(round(dw - 0.1)), int(round(dw + 0.1))
    img = cv2.copyMakeBorder(img, top, bottom, left, right, cv2.BORDER_CONSTANT, value=color)  # add border
    return img, ratio, (dw, dh)
if __name__ == '__main__':
    weights = '/media/htbao/KINGIDISK/目标检测/YOLOv1-v5/yolov5-4.0/runs/train/exp31/weights/last.pt'
    # weights ='/ media / htbao / KINGIDISK / yolov5_new / yolov5s.pt'
    imgsz = 416
    device = ''
    # Initialize
    set_logging()
    device = select_device(device)
    half = device.type != 'cpu'  # half precision only supported on CUDA

    # Load model
    model = attempt_load(weights, map_location=device)  # load FP32 model
    imgsz = check_img_size(imgsz, s=model.stride.max())  # check img_size
    if half:
        model.half()  # to FP16

    #ROS
    rospy.init_node('ros_yolo')
    #image_topic_1 = "/usb_cam/image_raw"
    image_topic_1 = "/kinect/rgb/image_raw"
    rospy.Subscriber(image_topic_1, Image, image_callback_1, queue_size=1, buff_size=52428800)
    image_pub = rospy.Publisher('/yolo_result_out', Image, queue_size=1)
    # rospy.init_node("yolo_result_out_node", anonymous=True)

    rospy.spin()
