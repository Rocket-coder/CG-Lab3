%APPROXIMATION;
x0=-5; x1=5; % the interval 
N=13;        % number of points
if ((mod(N-1,2)~=0)||(mod(N-1,3)~=0))
   error('Wrong number of points');
end   
[XF,YF,X,Y]=LineSpline(x0,x1,N);
%---- Quadratic approximation -------------------
M2=(N-1)/2; % number of intervals for quadratic approximation
Errors2=zeros(M2,1);
printstring('---- Quadratic approximation ','----')
for s=1:M2
  Errors2(s)=QuadraticApprox(X,Y,2*s-1); pause
end
maxerr=max(Errors2);
Error2=['max error=',number2str(maxerr,7,3)];
PlotGraph(XF,YF,6,['Quadratic Approximation:   ',Error2]);
hold off
pause
printstring('Quadratic approximation ',Error2)
printstring(' ',' ')
%---- Cubic approximation -------------------
printstring('---- Cubic approximation ','----')
M3=(N-1)/3; % number of intervals for cubic approximation
Errors3=zeros(M3,1);
for s=1:M3
    Errors3(s)=CubicApprox(X,Y,3*s-2); pause
end   
maxerr=max(Errors3);
Error3=['max error=',number2str(maxerr,7,3)];
PlotGraph(XF,YF,6,['Cubic Approximation:   ',Error3]);
hold off
printstring('Cubic approximation ',Error3)