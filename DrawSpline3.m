function DrawSpline3(X,Y,Px,Py,L,k,Name,Slope)
%
set(gcf,'Color','w') 
l=size(X,2);
%myscreen size =2L+1 
%-- Origin ---------------------------------------------
d = 0.3;
ts0='\fontsize{16}\bf\color{black}';
if ((L(1)*L(2)<=0)&(L(3)*L(4)<=0));
    plot(0,0,  '-ko','LineWidth',1,'MarkerEdgeColor','k',...
                     'MarkerFaceColor','k','MarkerSize',10); 
    text(-d, d, [ts0,'O']);             
end;                 
hold on
%-- Corners ---------------------------------------------
plot(L(1),L(3),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(L(2),L(3),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(L(1),L(4),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
            
plot(L(2),L(4),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5); 
hold on             
%-- Curve --------------------------------------------
plot(X,Y,'-bo','LineWidth',2,'MarkerEdgeColor','k',...
               'MarkerFaceColor','k','MarkerSize',1);     
hold on       
%-- Points -------------------------------------
d = 0.2;
ts2='\fontsize{16}\bf\color{blue}';
for p=1:4;
  plot(Px(p),Py(p),'-ko','LineWidth',1,'MarkerEdgeColor','r',...
                 'MarkerFaceColor','r','MarkerSize',8);   
  ps=int2str(p+k-1);
  text(Px(p)+d, Py(p), [ts2,'P_{',ps,'}']);       
  hold on
end;
%---------------------------------------------------------
set(gca,'XColor','b','YColor','b','fontsize',14,'fontweight','b');
ts1='\fontsize{22}\bf\color{red}';
title([ts1,Name]);  ylabel('y');
ts3='\fontsize{16}\bf\color{black}';
xlabel([ts3,Slope]); 
axis(L);
axis square; %axis tight; %axis equal 
grid on
%hold off
end
%


