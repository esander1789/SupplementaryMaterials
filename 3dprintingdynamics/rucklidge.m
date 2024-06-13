function ret=rucklidge(~,y)
% Function for the Rucklidge attractor
% 1: x'=-2x+6.7y-yz
% 2: y'=x
% 3: z'=-z+y^2
% 4: s'=sqrt(x'^2+y'^2+z'^2)

ret=zeros(4,1); % Initialize a column vector
ret(1)=-2*y(1)+6.7*y(2)-y(2)*y(3);
ret(2)=y(1);
ret(3)=-y(3)+y(2)^2;
ret(4)=sqrt(ret(1)^2+ret(2)^2+ret(3)^2);