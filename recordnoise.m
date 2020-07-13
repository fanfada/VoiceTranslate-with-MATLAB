% 录音录3秒钟
%clear,close all
%function myRecording=recording
Fs=8000;
recObj = audiorecorder(Fs,16,1);%创建一个保存音频信息的对象，它包含采样率，时间和录制的音频信息等等                                  
disp('Start speaking.')
recordblocking(recObj,2.125);
disp('End of Recording.');
play(recObj);% 回放录音数据
myRecording = getaudiodata(recObj);% 获取录音数据

global name;
name = 'noise.wav'; 
audiowrite(name,myRecording,Fs)%存储语音信号
y=audioread('noise.wav');
M=length(y);
disp(M)
t=(0:(M-1))/8000;
plot(t,y),title('原始语音信号'),grid% 绘制录音数据波形
path=which(name);
disp(path)


