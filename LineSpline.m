function [XF,YF,X,Y] = LineSpline(x0,x1,N)
%
dx=0.05;
TF=round((x1-x0)/dx);
XF=zeros(TF+1,1);
YF=zeros(TF+1,1);
for k=0:TF
    x=x0+k*dx;
    [y,Name]=equation(x); %y=0.65x-1.11sin(1.24x)-1.31cos(0.75x) 
    XF(k+1)=x; YF(k+1)=y;   
end
Dx=(x1-x0)/(N-1);
M=round(Dx/dx);
X=zeros(N,1);
Y=zeros(N,1);
X(1)=XF(1);  Y(1)=YF(1);
X(N)=XF(TF+1); Y(N)=YF(TF+1);
for k=1:N-2
    X(k+1)=XF(k*M); Y(k+1)=YF(k*M);   
end
PlotGraph(XF,YF,6,['Function ',Name]); hold off; 
pause
Name2=['Line approximation of ',Name,' on ',int2str(N),' points'];
PlotApprox(X,Y,6,Name2); hold off; 
pause
PlotGraph(XF,YF,6,Name);
PlotApprox(X,Y,6,'Compare'); hold off 
pause
end

