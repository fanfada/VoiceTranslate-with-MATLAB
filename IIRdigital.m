%ʹ��˫���Ա任�����IIR���ֵ�ͨ�˲���
clear,close all
w=0:0.01:pi;
T=2;Fs=1/T;
wp=input('����ͨ����ֹƵ�ʣ�');%��Ҫע����ǣ�ģ���˲����Ĺؼ�������ģ��Ƶ�ʣ�����2*pi��
ws=input('���������ֹƵ�ʣ�');
rp=input('����ͨ�����˥����');
rs=input('���������С˥����');
wp1=tan(wp/2);%ʹ��˫���Ա任��������Ԥ�������
ws1=tan(ws/2);
[N,wc]=buttord(wp1,ws1,rp,rs,'s');%�ý���֮���ָ�����butterworthģ���ͨ�˲����Ľ�����3DB��ֹƵ��
[num,den]=butter(N,wc,'s');%����butterworthģ���ͨ�˲�����ϵͳ�����Ķ���ʽϵ�������ӷ�ĸϵ����
[numz,denz]=bilinear(num,den,Fs);%ʹ��˫���Ա任��ת���������˲�������ʵ
                                 %��һ�����൱�ڴ���s=f(z)�Ǹ���ʽ��H(z)
H=freqz(numz,denz,w);

%[Nd,wcd]=buttord(wp,ws,rp,rs);%���ǲ�����Ԥ����ֱ����������˲��������Թ۲�
%[bz,az]=butter(Nd,wcd);%���ַ�����Ƶ��˲�����Ƶ��ĶԱȣ��кܴ���
%H1=freqz(bz,az,w);
n=-10:49;
%h1=impz(bz,az,n);

h=impz(numz,denz,n);
subplot(221),plot(w/pi,abs(H)),title(['IIR���ֵ�ͨ�˲���Ƶ����ӦN=',num2str(N)])
xlabel('Time index w/pi'),grid
subplot(222),stem(n,h,'.'),title('IIR���ֵ�ͨ�˲�����λ�����Ӧ')
xlabel('Time index n'),grid
G=20*log10(abs(H));
subplot(223),plot(w/pi,G),title('ֱ��IIR���ֵ�ͨ�˲���������')
xlabel('Time index w/pi'),grid
subplot(224),plot(w/pi,angle(H)),title('ֱ��IIR���ֵ�ͨ�˲���x��λ')
xlabel('Time index n'),grid
disp(numz)%��ʱ�������д�����ʾnumz������
disp(denz)


