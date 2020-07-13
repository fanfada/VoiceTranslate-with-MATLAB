clear,close all
w=-pi:0.01:pi;
Ts=2;%�������
Fs=1/Ts;%����Ƶ��
x=[4 -2 0 -4 -6 -4 -2 -4 -6 -6 -4 -4 -6 -6 -2 6 12 8 0 -16 -38 -60 -84 -90 -66 -32 -4 -2 -4 8 12 12 10 6 6 6 4 0 0 0 0 0 -2 -4 0 0 0 -2 -2 0 0 -2 -2 -2 -2 0];
%x=mstg;
wp=0.2*pi;%�����˲�����ָ��
ws=0.3*pi;
rp=1;
rs=30;
wpz=tan(wp/2);%Ԥ�������
wsz=tan(ws/2);
[N,wc]=buttord(wpz,wsz,rp,rs,'s');%��У������������buttord��ͨ�˲���
[num,den]=butter(N,wc,'s');%������Ƶ��˲����ķ��ӷ�ĸϵ��
[numz,denz]=bilinear(num,den,Fs);%ʹ��˫���Ա任��ת���������˲�������ʵ
                                 %��һ�����൱�ڴ���s=f(z)�Ǹ���ʽ��H(z)
H=freqz(numz,denz,w);%������Ƶ��˲�����Ƶ����Ӧ
N=length(x);
n=0:N-1;
h=impz(numz,denz,n);%�����漰���˲����ĵ�λ�����Ӧ
y=filter(h,1,x);%�˲�123456789012345678901234567890123456789012345678901234567890
%y=filter(numz,denz,x);%���Ͼ�Ч����ͬ
figure(1)
subplot(121),stem(n,x,'.'),title('x(n)�Ĳ���'),xlabel('Time index n'),grid
subplot(122),stem(n,y,'.'),title('y(n)�Ĳ���'),xlabel('Time index n'),grid
figure(2)
k=0:N-1;
X=fft(x,N);%��x����DFT
subplot(221),stem(k,abs(X),'.'),title('X�Ĳ���'),xlabel('Time index k'),grid
Y=fft(y,N);
subplot(222),stem(k,abs(Y),'.'),title('Y�Ĳ���'),xlabel('Time index k'),grid
G=fft(h,N);
subplot(223),stem(k,abs(G),'.'),title('G�Ĳ���'),xlabel('Time index k'),grid


