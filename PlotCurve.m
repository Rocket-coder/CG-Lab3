function PlotCurve(X,Y,L,Name)
% 
set(gcf,'Color','w') 
%-- Curve --------------------------------------------
plot(X,Y,'-ko','LineWidth',1,'MarkerEdgeColor','k',...
               'MarkerFaceColor','k','MarkerSize',1);     
%hold on       
%---------------------------------------------------------
set(gca,'XColor','b','YColor','b','fontsize',14,'fontweight','b');
ts1='\fontsize{20}\bf\color{red}';
ts3='\fontsize{16}\bf\color{blue}';
xlabel([ts3,'x']); ylabel([ts3,'y']); 
title([ts1,Name]);
axis(L);
axis square
grid on
%axis equal
%hold off
end

