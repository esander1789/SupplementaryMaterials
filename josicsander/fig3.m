clear all
clear
rand('state',sum(100*clock));
N=500000;

c=1.9;
d=0.25;

noisy=0.01;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = 0.1;
y = .2;

x1(N)=0;
y1(N)=0;

figure
hold on


redotsgaussx
x=x1(N);
y=y1(N);
redotsgaussx

plot(x1,y1,'.','markersize',1)

xlabel('x')
ylabel('y')

print -djpeg -r85 fig3x.jpg


%a1=0.08;
%b1=-1.2;
%c1=0.2;
%d1=0.2;
%plot([a1 a1 c1 c1 a1] ,[b1 d1 d1 b1 b1])

%figure
%plot(x1,y1,'.','markersize',1)
%xlabel('x')
%ylabel('y')
%axis([a1,c1,b1,d1])
%print -deps ts196c.eps

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = 0.1;
y = .2;

x1(N)=0;
y1(N)=0;

figure
hold on

redotsgaussy
x=x1(N);
y=y1(N);
redotsgaussy

plot(x1,y1,'.','markersize',1)

xlabel('x')
ylabel('y')

print -djpeg -r85 fig3y.jpg

%a1=0.08;
%b1=-1.2;
%c1=0.2;
%d1=0.2;
%plot([a1 a1 c1 c1 a1] ,[b1 d1 d1 b1 b1])

%figure
%plot(x1,y1,'.','markersize',1)
%xlabel('x')
%ylabel('y')
%axis([a1,c1,b1,d1])
%print -deps ts196c.eps

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

noisy=0.0;

x = 0.1;
y = .2;

x1(N)=0;
y1(N)=0;

figure
hold on


redotsgaussx
x=x1(N);
y=y1(N);
redotsgaussx

plot(x1,y1,'.','markersize',1)

xlabel('x')
ylabel('y')

print -djpeg -r85 fig3o.jpg

%a1=0.08;
%b1=-1.2;
%c1=0.2;
%d1=0.2;
%plot([a1 a1 c1 c1 a1] ,[b1 d1 d1 b1 b1])

%figure
%plot(x1,y1,'.','markersize',1)
%xlabel('x')
%ylabel('y')
%axis([a1,c1,b1,d1])
%print -deps ts196c.eps


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









