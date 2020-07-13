%使用双线性变换法设计IIR数字低通滤波器
clear,close all
w=0:0.01:pi;
T=2;Fs=1/T;
wp=input('输入通带截止频率：');%需要注意的是，模拟滤波器的关键参数是模拟频率（乘以2*pi）
ws=input('输入阻带截止频率：');
rp=input('输入通带最大衰减：');
rs=input('输入阻带最小衰减：');
wp1=tan(wp/2);%使用双线性变换法，进行预畸变矫正
ws1=tan(ws/2);
[N,wc]=buttord(wp1,ws1,rp,rs,'s');%用矫正之后的指标计算butterworth模拟低通滤波器的阶数和3DB截止频率
[num,den]=butter(N,wc,'s');%计算butterworth模拟低通滤波器的系统函数的多项式系数（分子分母系数）
[numz,denz]=bilinear(num,den,Fs);%使用双线性变换法转换成数字滤波器，其实
                                 %这一步就相当于带入s=f(z)那个公式求H(z)
H=freqz(numz,denz,w);

%[Nd,wcd]=buttord(wp,ws,rp,rs);%这是不经过预畸变直接设计数字滤波器，可以观察
%[bz,az]=butter(Nd,wcd);%两种方法设计的滤波器的频响的对比，有很大差别
%H1=freqz(bz,az,w);
n=-10:49;
%h1=impz(bz,az,n);

h=impz(numz,denz,n);
subplot(221),plot(w/pi,abs(H)),title(['IIR数字低通滤波器频率响应N=',num2str(N)])
xlabel('Time index w/pi'),grid
subplot(222),stem(n,h,'.'),title('IIR数字低通滤波器单位冲击响应')
xlabel('Time index n'),grid
G=20*log10(abs(H));
subplot(223),plot(w/pi,G),title('直接IIR数字低通滤波器的增益')
xlabel('Time index w/pi'),grid
subplot(224),plot(w/pi,angle(H)),title('直接IIR数字低通滤波器x相位')
xlabel('Time index n'),grid
disp(numz)%这时在命令行窗口显示numz的数据
disp(denz)


