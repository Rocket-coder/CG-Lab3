function PlotGraph(X,Y,L,Name)
% 
set(gcf,'Color','w') 
l=size(X,1);
%myscreen size =2L+1 
%-- Corners ---------------------------------------------
plot(0,0,  '-ko','LineWidth',1,'MarkerEdgeColor','g',...
                 'MarkerFaceColor','g','MarkerSize',10); 
hold on
plot(-L,-L,'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(-L, L,'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot( L,-L,'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot( L, L,'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);  
%-- Initial positions -------------------------------------
plot(X(1),Y(1),'-ko','LineWidth',1,'MarkerEdgeColor','r',...
                 'MarkerFaceColor','r','MarkerSize',8); 
hold on
plot(X(l),Y(l),'-ko','LineWidth',1,'MarkerEdgeColor','r',...
                 'MarkerFaceColor','r','MarkerSize',8); 
hold on
%-- Curve --------------------------------------------
plot(X,Y,'-ko','LineWidth',2,'MarkerEdgeColor','k',...
               'MarkerFaceColor','k','MarkerSize',1);     
%hold on       
%---------------------------------------------------------
set(gca,'XColor','b','YColor','b','fontsize',11,'fontweight','b');
ts1='\fontsize{22}\bf\color{red}';
%ts2='\fontsize{14}\bf\color{blue}';
title([ts1,Name]);
axis square
grid on
%axis equal
%hold off
end

