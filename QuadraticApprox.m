function err=QuadraticApprox(X,Y,k);
% Quadratic polynomial y=a+bx+cx^2 throuth three points 
x0=X(k); x1=X(k+1); x2=X(k+2);
y0=Y(k); y1=Y(k+1); y2=Y(k+2);
%-------------------------------------------------- 
Px = [x0, x1, x2];
Py = [y0, y1, y2];
%---Coefficients-----------------------------------
C = [1, x0, x0^2;...
     1, x1, x1^2;...
     1, x2, x2^2];
A = inv(C)*Py';
a = A(1); b = A(2); c = A(3);
A1=[c,b,a]; % for output
%----Array of values ------------------------------
dx=0.05;
T=round((x2-x0)/dx);
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
% L=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
l=6; L=[-l, l, -l, l];
sl0=2*c*x0+b;
sl2=2*c*x2+b;
Error=[',   error=',number2str(err,7,3)];
Slope0=['y''(',number2str(x0,7,1),')=',number2str(sl0,7,2)];
Slope2=['y''(',number2str(x2,7,1),')=',number2str(sl2,7,2)];
Slope=[Slope0,',    ',Slope2,Error];
PName=poly2str(A1); Name=['y= ',PName];
W=['For ',vec2strfloat([x0,x2],7,1),' : '];
printstring(W,[Name,',  ',Slope]);
DrawSpline2(X,Y,Px,Py,L,k,[W,Name],Slope);  
end

