function [XF,YF,X,Y] = GetPoints(x0,x1,N,L);
% N - number of points in the curve y=equation(x)
% [x0,x1] - interval
%-----------------------------------------------------
dx=0.05;
TF=round((x1-x0)/dx);
XF=zeros(TF+1,1);
YF=zeros(TF+1,1);
for k=0:TF;
    x=x0+k*dx;
    [y,Name]=equation(x);  
    XF(k+1)=x; YF(k+1)=y;   
end;
Dx=(x1-x0)/(N-1);
M=round(Dx/dx);
X=zeros(N,1);
Y=zeros(N,1);
X(1)=XF(1);  Y(1)=YF(1);
X(N)=XF(TF+1); Y(N)=YF(TF+1);
for k=1:N-2;
    X(k+1)=XF(k*M); Y(k+1)=YF(k*M);   
end;
%------------------------------------------------------
PlotPoints(X,Y,L, ['System of ',int2str(N),' ponts on  ',Name]); 
hold on 
%pause
PlotCurve(XF,YF,L,['System of ',int2str(N),' ponts on  ',Name]);
hold off
pause
end

