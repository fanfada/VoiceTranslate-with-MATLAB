N=240;
% w=0:0.01:pi;
y=audioread('myvoice.wav');

% %����Բ�˲�����ƴ�ͨ�˲���
% fpl=60;fpu=900;fsl=50;fsu=1000;
% wp=[2*fpl/Fs,2*fpu/Fs];ws=[2*fsl/Fs,2*fsu/Fs];rp=0.1;rs=60;
% [N1,wp]=ellipord(wp,ws,rp,rs);
% [B,A]=ellip(N1,rp,rs,wp);
% yt=filter(B,A,y);
% H2=freqz(B,A,w);
% subplot(211),plot(w/pi,abs(H2)),

x=y(14000:14239);
x=x.*boxcar(240);
R=zeros(1,240);
for k=1:240
    for n=1:240-k
        R(k)=R(k)+x(n).*x(n+k);             
    end
end
j=1:240;
plot(j,R),grid,title('��ʱ����غ���')

% Ѱ�ҷ�ֵ
% ind=find(j>50&j<240);
% maxf=max(R(ind));
% [x,y]=find(maxf==R(ind));
ind=R(50:240);%�˴���50�Ǹ������Լ����������������ģ�
              %�Ժ�ע������ط����޸�
[x,y]=max(ind);
y=y+49;
period=8000/y;


% j=1;
% for i=2:N-1
%     if spect(i)>spect(i-1)&&spect(i)>spect(i+1)
%         Loc(j)=i;Val(j)=spect(i);
%         j=j+1;
%     end
% end
% value(ii)=Fs/find_maxn(R);
% plot(value)
% xx=enframe(x,256,256);                          %��x 256���Ϊһ֡ 
% %a1��֡��ƽ��
% x1=xx(1,:);x2=xx(3,:);x3=xx(5,:);x4=xx(7,:);x5=xx(9,:);x6=xx(11,:);
% x2=(x1+x2+x3+x4+x5+x6)/6;
% u=filter([1 -.99],1,x2);                         % Ԥ����
% u2=u'.*hamming(wlen);                            % �źżӴ�����
% 
