% ¼��¼3����
%clear,close all
%function myRecording=recording
Fs=8000;
recObj = audiorecorder(Fs,16,1);%����һ��������Ƶ��Ϣ�Ķ��������������ʣ�ʱ���¼�Ƶ���Ƶ��Ϣ�ȵ�                                  
disp('Start speaking.')
recordblocking(recObj,2.125);
disp('End of Recording.');
play(recObj);% �ط�¼������
myRecording = getaudiodata(recObj);% ��ȡ¼������

global name;
name = 'noise.wav'; 
audiowrite(name,myRecording,Fs)%�洢�����ź�
y=audioread('noise.wav');
M=length(y);
disp(M)
t=(0:(M-1))/8000;
plot(t,y),title('ԭʼ�����ź�'),grid% ����¼�����ݲ���
path=which(name);
disp(path)


