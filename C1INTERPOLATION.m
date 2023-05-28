%C1INTERPOLATION;
x0=-5; x1=5; % the interval 
%N=13;        % number of points
N=11;
if (mod(N-1,2)~=0); error('Wrong number of points'); end
TS='C1-interpolation ';
% L=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
l=6; L=[-l, l, -l, l];   
[XF,YF,X,Y]=GetPoints(x0,x1,N,L);
%------------------------------------------------------
inislope=-0.13;     % any slope
%inislope=-0.1441;  % the precise slope of the equation at x0=-5
%inislope=-0.42; % from quadratic C0
%inislope=-0.40;  % from cubic C0
Sl2str=['y''(',number2str(x0,7,1),')=',number2str(inislope,7,2)];
%---- Quadratic C1-interpolation -------------------
TSC=['Quadratic ',TS];
printstring(['---- ',TSC],' ----')
M2=N-1;  % number of intervals for quadratic C1-interpolation
Errors2=zeros(M2,1); 
s0=inislope;
for k=1:M2
      [sl2,err]=QuadraticInterpC1(X,Y,s0, k,L); 
     Errors2(k)=err;
             s0=sl2;
      pause
end
maxerr=max(Errors2);  averr=mean(Errors2);
Error2=[': max err=', number2str(maxerr,7,3),...
        ', mean err=',number2str(averr,7,3)];
Title=[TSC,' for ',Sl2str];
PlotCurve(XF,YF,L,[Title,Error2]);
hold off
pause
printstring(Title,Error2)
printstring(' ',' ')
%---- Cubic approximation -------------------
TSC=['Cubic ',TS];
printstring(['---- ',TSC],' ----')
M3=(N-1)/2; % number of intervals for cubic C1-interpolation
Errors3=zeros(M3,1);
s0=inislope;
for k=1:M3
    [sl3,err]=CubicInterpC1(X,Y,s0,2*k-1,L);
     Errors3(k)=err;
             s0=sl3;
    pause
end    
maxerr=max(Errors3);  averr=mean(Errors3);
Error3=[': max err=', number2str(maxerr,7,3),...
        ', mean err=',number2str(averr,7,3)];
Title=[TSC,' for ',Sl2str];
PlotCurve(XF,YF,L,[Title,Error3]);
hold off
printstring(Title,Error3)