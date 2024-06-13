% Matlab code for plotting chaotic
% attractors. Output is data that is
% initially equally spaced points along the
% curve, but subdivide if the angle between
% line segments is not large enough

N=500; % N is maximum number of steps

NUM=1000; % NUM is the initial number of
% pieces of equal arc length
T=200; % T is the total time
init=[1,0,4.5]; % initial conditions
% solve the system, initial length=0
sol=ode45(@rucklidge,[0,T],[init,0]);
% y is the solution at a given time
y=deval(sol,T);
len=y(4); % len is the length of the curve
% Initialize data arrays, pos is position
% data, seg is segment length data
segnum=NUM; % current number of segments
% First point
pos=zeros(segnum+1,3); pos(1,:)=init;
% Last point
pos(segnum+1,:)=[y(1),y(2),y(3)];
% Location along arc of points
segment=(0:segnum)*len/segnum;
time=zeros(segnum+1,1); time(1)=0;
time(segnum+1)=T;
% time is time at each position

for i=1:segnum-1
   % Solve for the time for each new 
   % constant length piece using the 
   % secant method starting at the 
   % previous time, and plus a bit
   time(i+1)=secant(sol,segment(i+1), ...
      time(i));
   y=deval(sol,time(i+1));
   pos(i+1,:)=[y(1),y(2),y(3)];
end
% Plot equally-spaced-in-time data points
figure(1)
plot3(pos(:,1),pos(:,2),pos(:,3),'.-')
axis square, axis equal
'The code is paused so you can see incremental progress. Hit a key a few times to see it update... '
pause

done=false;
% Keep going until no segments need to be
% split
while ~done
   done=true;
   % Identify line segment vectors and
   % lengths
   vec=zeros(segnum,3);
   lenvec=zeros(segnum,1);
   for i=1:segnum
      vec(i,:)=pos(i+1,:)-pos(i,:);
      lenvec(i)=norm(vec(i,:));
   end
   % Identify angles between segments and
   % which ones to split
   ang=zeros(segnum-1,1);
   split=zeros(segnum,1);
   for i=1:segnum-1
      ang=acosd(sum(vec(i,:).* ...
         vec(i+1,:))/(lenvec(i)* ...
         lenvec(i+1)));
      if ang>10, split(i)=1;
         split(i+1)=1; done=false;
      end
   end
   disp(sum(split));
   
   % Split segments at half the distance
   % between endpoints
   newn=segnum+sum(split);
   newpos=zeros(newn+1,3);
   newpos(1,:)=init;
   newseg=zeros(newn+1,1);
   newseg(1)=0; newtime=zeros(newn+1,1);
   newtime(1)=0; newtime(newn+1)=T;
   j=1;
   for i=1:segnum
      if split(i)  % Add a new midpoint
         j=j+1;
         news=(segment(i)+segment(i+1))/2;
         newtime(j)=secant(sol,news, ...
            time(i)); y=deval(sol,newtime(j));
         newpos(j,:)=[y(1),y(2),y(3)]; 
         newseg(j)=news;
      end
      % Add endpoint
      j=j+1; newpos(j,:)=pos(i+1,:); 
      newseg(j)=segment(i+1);
      newtime(j)=time(i+1);
   end
   % Update variable list
   segment=newseg; pos=newpos; 
   time=newtime; segnum=newn;
   figure(1)
   plot3(pos(:,1),pos(:,2),pos(:,3),'.-')
   axis square, axis equal
   'The code is paused so you can see incremental progress. Hit a key a few times to see it update... '
   pause
end


'The code is now complete and is writing the data to the file rucklidge.txt'
% output data to file
f=fopen('rucklidge.txt','w');
for i=1:segnum+1
   fprintf(f,'[%f, %f, %f],\n',pos(i,:)); 
end

% Final plot of data
figure(1)
plot3(pos(:,1),pos(:,2),pos(:,3),'.')
axis square, axis equal
figure(2)
plot3(pos(:,1),pos(:,2),pos(:,3))
axis square, axis equal