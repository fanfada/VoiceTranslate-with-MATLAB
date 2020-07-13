clear,close all
w=-pi:0.01:pi;
Ts=2;%抽样间隔
Fs=1/Ts;%抽样频率
x=[4 -2 0 -4 -6 -4 -2 -4 -6 -6 -4 -4 -6 -6 -2 6 12 8 0 -16 -38 -60 -84 -90 -66 -32 -4 -2 -4 8 12 12 10 6 6 6 4 0 0 0 0 0 -2 -4 0 0 0 -2 -2 0 0 -2 -2 -2 -2 0];
%x=mstg;
wp=0.2*pi;%数字滤波器的指标
ws=0.3*pi;
rp=1;
rs=30;
wpz=tan(wp/2);%预畸变矫正
wsz=tan(ws/2);
[N,wc]=buttord(wpz,wsz,rp,rs,'s');%用校正后的数据设计buttord低通滤波器
[num,den]=butter(N,wc,'s');%求所设计的滤波器的分子分母系数
[numz,denz]=bilinear(num,den,Fs);%使用双线性变换法转换成数字滤波器，其实
                                 %这一步就相当于带入s=f(z)那个公式求H(z)
H=freqz(numz,denz,w);%求所设计的滤波器的频率响应
N=length(x);
n=0:N-1;
h=impz(numz,denz,n);%求所涉及的滤波器的单位冲击响应
y=filter(h,1,x);%滤波123456789012345678901234567890123456789012345678901234567890
%y=filter(numz,denz,x);%与上句效果相同
figure(1)
subplot(121),stem(n,x,'.'),title('x(n)的波形'),xlabel('Time index n'),grid
subplot(122),stem(n,y,'.'),title('y(n)的波形'),xlabel('Time index n'),grid
figure(2)
k=0:N-1;
X=fft(x,N);%对x进行DFT
subplot(221),stem(k,abs(X),'.'),title('X的波形'),xlabel('Time index k'),grid
Y=fft(y,N);
subplot(222),stem(k,abs(Y),'.'),title('Y的波形'),xlabel('Time index k'),grid
G=fft(h,N);
subplot(223),stem(k,abs(G),'.'),title('G的波形'),xlabel('Time index k'),grid


