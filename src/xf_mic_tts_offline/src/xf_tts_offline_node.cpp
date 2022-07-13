/****************************************************************************
 content : 离线语音合成
 接口类型 :服务
 接口内容:要合成的文本＋说话人 
/****************************************************************************/

#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <string>
#include "qtts.h"
#include "msp_cmn.h"
#include "msp_errors.h"
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Int32.h"
#include <sstream>
#include <sys/types.h>
#include <sys/stat.h>
#include <xf_mic_tts_offline/Play_TTS_srv.h>

using namespace std;
string pkg_path = " ";         
static std::string appID = " "; //default appID

#define MAX_PARAMS_LEN (1024)
/* wav音频头部格式 */
typedef struct _wave_pcm_hdr
{
    char riff[4]; // = "RIFF"
    int size_8;   // = FileSize - 8
    char wave[4]; // = "WAVE"
    char fmt[4];  // = "fmt "
    int fmt_size; // = 下一个结构体的大小 : 16

    short int format_tag;      // = PCM : 1
    short int channels;        // = 通道数 : 1
    int samples_per_sec;       // = 采样率 : 8000 | 6000 | 11025 | 16000
    int avg_bytes_per_sec;     // = 每秒字节数:samples_per_sec*bits_per_sample/8
    short int block_align;     // = 每采样点字节数 : wBitsPerSample / 8
    short int bits_per_sample; // = 量化比特数: 8 | 16

    char data[4];  // = "data";
    int data_size; // = 纯数据长度 : FileSize - 44
} wave_pcm_hdr;

/* 默认wav音频头部数据 */
wave_pcm_hdr default_wav_hdr =
    {
        {'R', 'I', 'F', 'F'},
        0,
        {'W', 'A', 'V', 'E'},
        {'f', 'm', 't', ' '},
        16,

        1,
        1,
        16000,
        32000,
        2,
        16,

        {'d', 'a', 't', 'a'},
        0};

/* 文本合成，即音频文件的写入过程 */
int text_to_speech(const char *src_text, const char *des_path, const char *params)
{
    int ret = -1;
    FILE *fp = NULL;
    const char *sessionID = NULL;
    unsigned int audio_len = 0;
    wave_pcm_hdr wav_hdr = default_wav_hdr;
    int synth_status = MSP_TTS_FLAG_STILL_HAVE_DATA;

    if (NULL == src_text || NULL == des_path)
    {
        printf("params is error!\n");
        return ret;
    }

    fp = fopen(des_path, "wb");
    if (NULL == fp)
    {
        printf("open ( %s ) error.\n", des_path);
        return ret;
    }

    /* 开始合成 */
    sessionID = QTTSSessionBegin(params, &ret);
    if (MSP_SUCCESS != ret)
    {
        printf("QTTSSessionBegin failed, error code: %d.\n", ret);
        fclose(fp);
        return ret;
    }
    ret = QTTSTextPut(sessionID, src_text, (unsigned int)strlen(src_text), NULL);
    if (MSP_SUCCESS != ret)
    {
        printf("QTTSTextPut failed, error code: %d.\n", ret);
        QTTSSessionEnd(sessionID, "TextPutError");
        fclose(fp);
        return ret;
    }
    fwrite(&wav_hdr, sizeof(wav_hdr), 1, fp); //添加wav音频头，使用采样率为16000
    while (1)
    {
        /* 获取合成音频 */
        const void *data = QTTSAudioGet(sessionID, &audio_len, &synth_status, &ret);
        if (MSP_SUCCESS != ret)
            break;

        if (NULL != data)
        {
            fwrite(data, audio_len, 1, fp);
            wav_hdr.data_size += audio_len; //计算data_size大小
        }
        if (MSP_TTS_FLAG_DATA_END == synth_status)
            break;
        printf(">");
        usleep(30 * 1000); //防止频繁占用CPU
    }                      //合成状态synth_status取值请参阅《讯飞语音云API文档》
    printf("\n");

    if (MSP_SUCCESS != ret)
    {
        printf("QTTSAudioGet failed, error code: %d.\n", ret);
        QTTSSessionEnd(sessionID, "AudioGetError");
        fclose(fp);
        return ret;
    }

    /* 修正wav文件头数据的大小 */
    wav_hdr.size_8 += wav_hdr.data_size + (sizeof(wav_hdr) - 8);

    /* 将修正过的数据写回文件头部,音频文件为wav格式 */
    fseek(fp, 4, 0);
    fwrite(&wav_hdr.size_8, sizeof(wav_hdr.size_8), 1, fp);       //写入size_8的值
    fseek(fp, 40, 0);                                             //将文件指针偏移到存储data_size值的位置
    fwrite(&wav_hdr.data_size, sizeof(wav_hdr.data_size), 1, fp); //写入data_size的值
    fclose(fp);
    fp = NULL;

    /* 合成完毕 */
    ret = QTTSSessionEnd(sessionID, "Normal");
    if (MSP_SUCCESS != ret)
    {
        printf("QTTSSessionEnd failed, error code: %d.\n", ret);
    }

    return ret;
}

//进行音频文件的合成，需要登录信息以及资源信息
int xf_mic_tts(const char *text, const char *filename, const char *pAppID, string package_path, string VOICE_NAME = "xiaoyan", int VOLUME = 100)
{
    int ret = MSP_SUCCESS;
    char session_begin_params[MAX_PARAMS_LEN] = {NULL};
    char login_params[MAX_PARAMS_LEN] = {NULL};
    snprintf(login_params, MAX_PARAMS_LEN - 1, "appid = %s,work_dir=.", appID.c_str());
    string TTS_RES_PATH = "fo|" + package_path + "/config/msc/res/tts/xiaoyan.jet;fo|" + package_path + "/config/msc/res/tts/common.jet";
    if (VOICE_NAME == "xiaofeng")
    {
        TTS_RES_PATH = "fo|" + package_path + "/config/msc/res/tts/xiaofeng.jet;fo|" + package_path + "/config/msc/res/tts/common.jet";
    }
    snprintf(session_begin_params, MAX_PARAMS_LEN - 1,
             "engine_type = local, \
		voice_name= %s, text_encoding = UTF8, \
		tts_res_path = %s, sample_rate = 16000, \
		speed = 70, volume = %d, pitch = 50, rdn = 2,  ",/*70 speed_increase = 2,*/
             VOICE_NAME.c_str(),
             TTS_RES_PATH.c_str(),
             VOLUME);
    cout << "a:" << session_begin_params << endl;

    /* 用户登录 *//*catkin_make -DCATKIN_WHITELIST_PACKAGES=" 你的包名"*/
    ret = MSPLogin("NULL", "NULL", login_params); //第一个参数是用户名，第二个参数是密码，第三个参数是登录参数，用户名和密码可在http://open.voicecloud.cn注册获取
    if (MSP_SUCCESS != ret)
    {
        printf("MSPLogin failed, error code: %d.\n", ret);
        MSPLogout(); //退出登录
        return 1;
        //goto exit; //登录失败，退出登录
    }
    ret = text_to_speech(text, filename, session_begin_params);
    if (MSP_SUCCESS != ret)
    {
        printf("text_to_speech failed, error code: %d.\n", ret);
        MSPLogout(); //退出登录
        return 2;
    }
    printf("合成完毕\n");

exit:
    MSPLogout(); //退出登录
    return 0;
}

/**
 * 播放音频文件，音频文件是保存在本地的，可调用system的play进行播放
 */
void playVoice(xf_mic_tts_offline::Play_TTS_srv::Request &req)
{
    string play_audio_path = "play " + pkg_path + "/audio/" +req.text.c_str() +".wav";
    system(play_audio_path.c_str());
}
void playVoice1()
{
    string play_audio_path = "play " + pkg_path + "/audio/本次运输的菜品是.wav";
    system(play_audio_path.c_str());
    play_audio_path = "play " + pkg_path + "/audio/蔬菜.wav";
    system(play_audio_path.c_str());
}
void playVoice2()
{
    string play_audio_path = "play " + pkg_path + "/audio/本次运输的菜品是.wav";
    system(play_audio_path.c_str());
    play_audio_path = "play " + pkg_path + "/audio/水果.wav";
    system(play_audio_path.c_str());
}
void playVoice3()
{   
    string play_audio_path = "play " + pkg_path + "/audio/本次运输的菜品是.wav";
    system(play_audio_path.c_str());
    play_audio_path = "play " + pkg_path + "/audio/肉类.wav";
    system(play_audio_path.c_str());
}
void playVoice4()
{
    string play_audio_path = "play " + pkg_path + "/audio/开始启动.wav";
    system(play_audio_path.c_str());
}
void playVoice5()
{
    string play_audio_path = "play " + pkg_path + "/audio/开始脱困.wav";
    system(play_audio_path.c_str());
}
void playVoice35()
{
    string play_audio_path = "play " + pkg_path + "/audio/111.mp3";
    system(play_audio_path.c_str());
}
void playVoiceByPerson(string word)
{
    string path = pkg_path + "/audio/say.wav";
    xf_mic_tts(word.c_str(), path.c_str(), appID.c_str(), pkg_path);
    playVoice1();
}

/**
 * 回调函数，接受的话题内容为要播报的内容
 */
bool xf_mic_tts_callback(xf_mic_tts_offline::Play_TTS_srv::Request &req,
                         xf_mic_tts_offline::Play_TTS_srv::Response &res)
{
    char cmd[2000];
    if (req.text.size() > 0)
    {
 if(req.text=="本次送餐任务途中遇到0个人，其中长头发：0人。戴眼镜：0人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到0个人，其中长头发：0人。戴眼镜：0人。.wav";
    system(play_audio_path.c_str());}
 else if(req.text=="本次送餐任务途中遇到1个人，其中长头发：0人。戴眼镜：0人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到1个人，其中长头发：0人。戴眼镜：0人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到1个人，其中长头发：0人。戴眼镜：1人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到1个人，其中长头发：0人。戴眼镜：1人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到1个人，其中长头发：1人。戴眼镜：0人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到1个人，其中长头发：1人。戴眼镜：0人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到1个人，其中长头发：1人。戴眼镜：1人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到1个人，其中长头发：1人。戴眼镜：1人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到2个人，其中长头发：0人。戴眼镜：0人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到2个人，其中长头发：0人。戴眼镜：0人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到2个人，其中长头发：1人。戴眼镜：0人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到2个人，其中长头发：1人。戴眼镜：0人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到2个人，其中长头发：2人。戴眼镜：0人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到2个人，其中长头发：2人。戴眼镜：0人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到2个人，其中长头发：0人。戴眼镜：1人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到2个人，其中长头发：0人。戴眼镜：1人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到2个人，其中长头发：0人。戴眼镜：2人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到2个人，其中长头发：0人。戴眼镜：2人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到2个人，其中长头发：1人。戴眼镜：1人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到2个人，其中长头发：1人。戴眼镜：1人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到2个人，其中长头发：2人。戴眼镜：1人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到2个人，其中长头发：2人。戴眼镜：1人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到2个人，其中长头发：1人。戴眼镜：2人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到2个人，其中长头发：1人。戴眼镜：2人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="本次送餐任务途中遇到2个人，其中长头发：2人。戴眼镜：2人。")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/本次送餐任务途中遇到2个人，其中长头发：2人。戴眼镜：2人。.wav";
         system(play_audio_path.c_str());
       }
 else if(req.text=="您的菜品已送达，请您取餐！")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
         string play_audio_path = "play " + pkg_path + "/audio/您的菜品已送达，请您取餐！.wav";
         system(play_audio_path.c_str());
       }
else{
        std::cout << "I will speak:" << req.text.c_str() << std::endl;
        //语音合成到本地路径
        //string path = pkg_path + "/audio/say.wav";
        string path = pkg_path + "/audio/" + req.text.c_str()+".wav";
        string speaker = "xiaoyan";

        if (req.speakerName.size() > 1)
        {
            speaker = req.speakerName;
        }

        int ret = xf_mic_tts(req.text.c_str(), path.c_str(), appID.c_str(), pkg_path, speaker.c_str());
        if (ret == 1)
        {
            res.result = "fail";
            res.fail_reason = "login_error";
        }
        else if (ret == 2)
        {
            res.result = "fail";
            res.fail_reason = "11212_license_expired_error";
        }
        else
        {
            playVoice(req);
            res.result = "ok";
            res.fail_reason = "";
        }
}
    }
    else
    {
        res.result = "fail";
        res.fail_reason = "text is null_error";
    }
    ROS_INFO("send result to client,finish to paly text\n");
    return true;
}

bool voiceopen_callback(xf_mic_tts_offline::Play_TTS_srv::Request &req,
                         xf_mic_tts_offline::Play_TTS_srv::Response &res)
{
   
    if (req.text.size() > 0)
    {
        if(req.text=="蔬菜")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
        playVoice1();}
 if(req.text=="水果")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
        playVoice2();}
 if(req.text=="肉类")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
        playVoice3();}
 if(req.text=="开始启动")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
        playVoice4();}
 if(req.text=="开始脱困")        
       { std::cout << "I will speak:" << req.text.c_str() << std::endl;
        playVoice5();}
    }
    else
    {
        res.result = "fail";
        res.fail_reason = "text is null_error";
    }
    ROS_INFO("send result to client,finish to paly text\n");
    return true;
}

int main(int argc, char **argv)
{
    //const char *filename = path;          //合成的语音文件名称
    string greet_word = "系统启动成功！"; //default need composed greet word
    string tts_service = "play_txt_wav";  //default tts topic
    ros::init(argc, argv, "xf_tts_offline_node");
    ros::NodeHandle n("~");

    ros::param::get("~greet_word", greet_word);
    ros::param::get("~tts_service", tts_service);
    n.param("source_path", pkg_path, std::string("./"));
    n.param("appid", appID, std::string("5de09283"));
    //首先播报开机成功
    //playVoiceByPerson(greet_word);
    //订阅函数声明
    ros::ServiceServer service_play_tts = n.advertiseService(tts_service, xf_mic_tts_callback);
    ros::ServiceServer voiceopen = n.advertiseService("voiceopen", voiceopen_callback);
    ros::spin();

    return 0;
}
