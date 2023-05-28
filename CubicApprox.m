function err=CubicApprox(X,Y,k);
% Cubic polynomial y=a+bx+cx^2+dx^3 throuth four points 
x0=X(k); x1=X(k+1); x2=X(k+2); x3=X(k+3);
y0=Y(k); y1=Y(k+1); y2=Y(k+2); y3=Y(k+3);
%-------------------------------------------------- 
Px = [x0, x1, x2, x3];
Py = [y0, y1, y2, y3];
%---Coefficients-----------------------------------
C = [1, x0, x0^2, x0^3;...
     1, x1, x1^2, x1^3;...
     1, x2, x2^2, x2^3;...
     1, x3, x3^2, x3^3];
A = inv(C)*Py';
a = A(1); b = A(2); c = A(3); d = A(4);
A1=[d,c,b,a]; % for output
%----Array of values ------------------------------
dx=0.05;
T=round((x3-x0)/dx);
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
% L=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
l=6; L=[-l, l, -l, l];
sl0=polynom2(b,2*c,3*d,x0);
sl3=polynom2(b,2*c,3*d,x3);
Error=[',   error=',number2str(err,7,3)];
Slope0=['y''(',number2str(x0,7,1),')=',number2str(sl0,7,2)];
Slope3=['y''(',number2str(x3,7,1),')=',number2str(sl3,7,2)];
Slope=[Slope0,',    ',Slope3,Error];
PName=poly2str(A1); Name=['y= ',PName];
W=['For ',vec2strfloat([x0,x3],7,1),' : '];
printstring(W,[Name,',  ',Slope]);
DrawSpline3(X,Y,Px,Py,L,k,[W,Name],Slope);  
end

