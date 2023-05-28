function [sl2,err]=QuadraticInterpC1(X,Y,s0,k,L);
% Quadratic polynomial y=a+bx+cx^2 throuth two points
% and with the given slope s0 at the initial point (xk,yk)
%----------------------------------------------------
x0=X(k); x1=X(k+1); 
y0=Y(k); y1=Y(k+1); 
%---------------------------------------------------- 
Px = [x0, x1];            % 
Py = [y0, y1];            % 
V  = [y0; y1; s0];        % 
%--- Evaluation of Coefficients of the spline -------
C = [1, x0, x0^2;...
     1, x1, x1^2;...
     0,  1, 2*x0];
A = inv(C)*V;
a = A(1); b = A(2); c = A(3);
A1=[c,b,a]; % for output
%----Array of values and error estimation -----------
dx=0.05;
T=round((x1-x0)/dx);
X=zeros(T+1,1); Y=zeros(T+1,1);
err=0;
for p=0:T;
    x=x0+p*dx;
    X(p+1)=x;
    ya=polynom2(a,b,c,x);
    Y(p+1)=ya;
    [yp,~]=equation(x);
    if abs(ya-yp)>err; err=abs(ya-yp); end;    
end;
%--- Output ---------------------------------------
sl0=2*c*x0+b;
sl2=2*c*x1+b;
Error=[',   err=',number2str(err,7,3)];
Title='Quadratic C^1-interpolation : ';
Slope0=['y''(',number2str(x0,7,1),')=',number2str(sl0,7,2)];
Slope2=['y''(',number2str(x1,7,1),')=',number2str(sl2,7,2)];
Slope1=[Slope0,',    ',Slope2,Error];
Slope=[Title,Slope1];
PName=poly2str(A1); Name=['y= ',PName];
W=[vec2strfloat([x0,x1],7,1),' : '];
printstring(W,[Name,',  ',Slope1]);
DrawSpline2(X,Y,Px,Py,L,k,[W,Name],Slope);  
end

