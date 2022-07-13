#include <stdio.h>
//#include <unistd.h>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>

using namespace std;
using namespace cv;

//g++ -o getvideo getvideo.cpp `pkg-config --libs --cflags opencv`
int main()
{
	VideoCapture cap(0);

	if (!cap.isOpened())
	{
		printf("open video failed!\n");
		return 1;
	}

	Mat Frame;
        cap.set(CV_CAP_PROP_BRIGHTNESS, 100);
        cout<<cap.get(CV_CAP_PROP_BRIGHTNESS)
	//设置保存的视频帧数目
	int frameNum = 45000;
	//保存视频的路径
	string outputVideoPath = "./test.avi";
	//获取当前摄像头的视频信息
	cv::Size sWH = cv::Size((int)cap.get(CV_CAP_PROP_FRAME_WIDTH),
		(int)cap.get(CV_CAP_PROP_FRAME_HEIGHT));
	VideoWriter outputVideo;
	outputVideo.open(outputVideoPath, CV_FOURCC('M', 'P', '4', '2'), 45, sWH);

	while (cap.isOpened() && frameNum > 0)
	{
		cap >> Frame;
		if (Frame.empty()) break;
		outputVideo << Frame;
		frameNum--;

		imshow("img", Frame);
		waitKey(1);

		if (char(waitKey(1)) == 'q') break;
	}

	outputVideo.release();
	//system("pause");
    //pause();
}
