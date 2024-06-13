clear all
clear

N=500000;

noisy=0.003;

c=1.9;
d=0.4;

x = 0.1;
y = .2;

x1(N)=0;
y1(N)=0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
hold on

rand('state',sum(100*clock));

redotentgaussx
x=x1(N);
y=y1(N);
redotentgaussx
plot(x1,y1,'.','markersize',1)

xlabel('x')
ylabel('y')

print -djpeg -r85 fig2x.jpg

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure
hold on

rand('state',sum(100*clock));

redotentgaussy
x=x1(N);
y=y1(N);
redotentgaussy
plot(x1,y1,'.','markersize',1)

xlabel('x')
ylabel('y')

print -djpeg -r85 fig2y.jpg


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

noisy=0;

figure
hold on

rand('state',sum(100*clock));

redotentgaussy
x=x1(N);
y=y1(N);
redotentgaussy
plot(x1,y1,'.','markersize',1)

xlabel('x')
ylabel('y')

print -djpeg -r85 fig2o.jpg





