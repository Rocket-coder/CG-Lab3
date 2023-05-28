function [sl3,err]=CubicInterpC1(X,Y,s0,k,L);
% Cubic polynomial y=a+bx+cx^2+dx^3 throuth three points
% and with the given slope s0 at the initial point (xk,yk)
x0=X(k); x1=X(k+1); x2=X(k+2); 
y0=Y(k); y1=Y(k+1); y2=Y(k+2); 
%-------------------------------------------------- 
Px = [x0, x1, x2];
Py = [y0, y1, y2];
V  = [y0; y1; y2; s0];    
%---Coefficients-----------------------------------
C = [1, x0, x0^2,   x0^3;...
     1, x1, x1^2,   x1^3;...
     1, x2, x2^2,   x2^3;...
     0,  1, 2*x0, 3*x0^2];
A = inv(C)*V;
a = A(1); b = A(2); c = A(3); d = A(4);
A1=[d,c,b,a]; % for output
%----Array of values ------------------------------
dx=0.05;
T=round((x2-x0)/dx);
X=zeros(T+1,1); Y=zeros(T+1,1);
err=0;
for p=0:T;
    x=x0+p*dx;
    X(p+1)=x;
    ya=polynom3(a,b,c,d,x);
    Y(p+1)=ya;
    [yp,~]=equation(x);
    if abs(ya-yp)>err; err=abs(ya-yp); end;    
end;
%--- Output ---------------------------------------
sl0=polynom2(b,2*c,3*d,x0);
sl3=polynom2(b,2*c,3*d,x2);
Title='Cubic C^1-interpolation : ';
Error=[',   err=',number2str(err,7,3)];
Slope0=['y''(',number2str(x0,7,1),')=',number2str(sl0,7,2)];
Slope2=['y''(',number2str(x2,7,1),')=',number2str(sl3,7,2)];
Slope1=[Slope0,',    ',Slope2,Error];
Slope=[Title,Slope1];
PName=poly2str(A1); Name=['y= ',PName];
W=[vec2strfloat([x0,x2],7,1),' : '];
printstring(W,[Name,',  ',Slope1]); 
DrawSpline2(X,Y,Px,Py,L,k,[W,Name],Slope);  
end

