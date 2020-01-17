figure1=figure(1);
E_var=[-76.24141658   -76.24156678 -76.24162225 -76.24165053 -76.24166273];
E_tot=[-76.24166701   -76.24166743 -76.24166764 -76.24166801 -76.24166831];

%axes1 = axes('Parent',figure1,'Position',[0.17103153393907 0.135620652855094 0.804917156600748 0.857428006529216]);
axes1=axes('Parent',figure1,'Position',[0.17103153393907 0.135620652855094 0.804917156600748 0.805924232322359]);   
hold(axes1,'on');

%hold('on')
%title('Energy of CAS(54,54) for FeMoco','interpreter','latex','FontSize',40);
xlabel('$E_{\textrm{var}}-E_{\textrm{tot}}$ (Hartree)','Interpreter','latex','FontSize',48);
ylabel('Energy (Hartree)','Interpreter','latex','FontSize',48),
yticklabels('auto');
box('on');grid('on');grid('minor');
set(gca,'XMinorTick','on','YMinorTick','on','LineWidth',2,'FontSize',30);
ax = gca;
ax.XAxis.TickLabelFormat = '%.3f';
ax.YAxis.TickLabelFormat = '%.3f';
ax.YRuler.Exponent = 0;

% yh = get(gca,'ylabel'); % handle to the label object
% p = get(yh,'position'); % get the current position property
% p(2) = 0.5*p(2) ;        % double the distance, 
% set(yh,'position',p);   % set the new position

%plot(E_var-E_tot,E_var,'r','linewidth',5);
%plot(E_var-E_tot,E_tot,'r','linewidth',5)

% splineMesh=x(1):0.1:x(end);
% plot(splineMesh,spline(x,y,splineMesh),'r','LineWidth',5);

%axis([0 max(E_var-E_tot)+0.002 min(E_tot)-0.02 max(E_var)+0.01])
%axis([0 11e-5 -13482.185 -13482.07]);
%axes('Parent',fig1,'Position',[0.176910742918226 0.123138033763654 0.81881346873329 0.860973187686196]);

% All points

x=0:0.0001:(max(E_var-E_tot)+0.02);

% f1 = polyfit(E_var-E_tot,E_var,1);
% f2 = polyfit(E_var-E_tot,E_tot,1);

f1 = polyfitweighted(E_var-E_tot,E_var,1,1./(E_var-E_tot).^2);
f2 = polyfitweighted(E_var-E_tot,E_tot,1,1./(E_var-E_tot).^2);

l1=f1(1)*x+f1(2);
l2=f2(1)*x+f2(2);

%plot(x,l1,'r--','LineWidth',5);
%plot(x,l2,'r--','LineWidth',5);

% g1 = polyfit(E_var-E_tot,E_var,2);
% g2 = polyfit(E_var-E_tot,E_tot,2);

g1 = polyfitweighted(E_var-E_tot,E_var,2,1./(E_var-E_tot).^2);
g2 = polyfitweighted(E_var-E_tot,E_tot,2,1./(E_var-E_tot).^2);

q1=g1(1)*x.^2+g1(2)*x+g1(3);
q2=g2(1)*x.^2+g2(2)*x+g2(3);

plotHandle(1)=plot(x,q1,'Color',[0.5 0.5 0.5],'LineWidth',5);
plotHandle(2)=plot(x,q2,'Color',[  0   0   0]./255,'LineWidth',5);

h1 = polyfit(E_var-E_tot,E_var,3);
h2 = polyfit(E_var-E_tot,E_tot,3);

c1=h1(1)*x.^3 + h1(2)*x.^2 + h1(3)*x + h1(4);
c2=h2(1)*x.^3 + h2(2)*x.^2 + h1(3)*x + h2(4);

% Final energy with error bar

%scatter(0,-13482.181,200,'k','MarkerFaceColor','k');
%errorbar(0,mean([f6(2) f4(2) f2(2)]),0.001,'o','LineWidth',5,'MarkerSize',20,'MarkerFaceColor','k','Color','k','CapSize',20)
%errorbar(0,mean([f6(2) f4(2) f2(2)]),0.0001,'o','LineWidth',5,'MarkerSize',20,'MarkerFaceColor','k','Color','k','CapSize',20)

scatter(E_var-E_tot,E_var,250,'MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5]);
scatter(E_var-E_tot,E_tot,250,'MarkerEdgeColor',[0     0   0]./255,'MarkerFaceColor',[0 0 0]);

set(gcf, 'Color', 'w');
set(gcf,'renderer','Painters');

annotation(figure1,'textbox',[0.674669821176436 0.897627396605498 0.131316282511403 0.0569962544347223],'String','SHCI($E_\textrm{tot}$)','LineStyle','none','Interpreter','latex','FontSize',36,'FitBoxToText','off','BackgroundColor',[1 1 1]);
annotation(figure1,'textbox',[0.286107555008634 0.89866474100384 0.131316282511403 0.0569962544347223],'String','SHCI($E_\textrm{var}$)','LineStyle','none','Interpreter','latex','FontSize',36,'FitBoxToText','off','BackgroundColor',[1 1 1]);

%annotation(figure1,'textbox',[0.88471792379532 0.906653426017875 0.0751965604377048 0.0490518651596458],'String','CCSD','LineStyle','none','Interpreter','latex','FontSize',36,'FitBoxToText','off','BackgroundColor',[1 1 1]);
%annotation(figure1,'textbox',[0.76055585248523 0.481327800829876 0.199893105291308 0.0577121971922653],'String','DMRG\,(D=2000)','LineStyle','none','Interpreter','latex','FontSize',36,'FitBoxToText','off','BackgroundColor',[1 1 1]);
%annotation(figure1,'textbox',[0.856017964313709 0.402184707050645 0.103896519919317 0.0496524329692133],'String','CCSD(T)','LineStyle','none','Interpreter','latex','FontSize',36,'FitBoxToText','off','BackgroundColor',[1 1 1]);
%annotation(figure1,'textbox',[0.759486905398109 0.316390041493776 0.199893105291308 0.0596570891724709],'String','DMRG\,(D=4000)','LineStyle','none','Interpreter','latex','FontSize',36,'FitBoxToText','off','BackgroundColor',[1 1 1]);
%annotation(figure1,'textbox',[0.759486905398109 0.316390041493776 0.199893105291308 0.0596570891724709],'String','DMRG\,(D=5000)','LineStyle','none','Interpreter','latex','FontSize',36,'FitBoxToText','off','BackgroundColor',[1 1 1]);
%annotation(figure1,'textbox',[0.70978086584709 0.205394190871369 0.247995724211653 0.060424538603219],'String','DMRG\,(extrapolated)','LineStyle','none','Interpreter','latex','FontSize',36,'FitBoxToText','off','BackgroundColor',[1 1 1]);

hold('on')

ax_pos = ax.Position; % position of first axes
%%ax2 = axes('Position',ax_pos,'XAxisLocation','top','Color','none');
%axes2 = axes('Parent',figure1,'Position',[0.17103153393907 0.135620652855094 0.804917156600748 0.805924232322359],'XAxisLocation','top','Color','none');
%set(axes2,'ytick',[],'XMinorTick','off','YMinorTick','off','LineWidth',2,'FontSize',30,'YTickLabel',[]);
%axes2.XAxis.TickLabelFormat = '%.0f';
%axes2.XRuler.Exponent = -5;
%axis([0 1e3*8e-5 -13482.185 -13482.07]);
hold('on')


%axesCC = axes('Parent',figure1,'Position',[0.17103153393907 0.135620652855094 0.804917156600748 0.805924232322359],'XAxisLocation','top','Color','none');
%set(axesCC,'ytick',[],'XMinorTick','off','YMinorTick','off','LineWidth',2,'FontSize',30,'YTickLabel',[],'XTickLabel',[]);
%axesCC.XAxis.TickLabelFormat = '%.0f';
%axesCC.XRuler.Exponent = -5;
%axis([0 0.25 -13482.185 -13482.07]);
hold('on')

% CCSD=-13482.154243391968;
% CCSDT=-13482.177790577623;
% CCSDTQ=-13482.18178301;
% 
% slope=(CCSDT-CCSDTQ)/(CCSD-2*CCSDT+CCSDTQ);
% yIntercept = CCSDTQ - slope*(CCSDT-CCSDTQ);
% 
% xForCCSD=(CCSD-yIntercept)/slope;
% CCS_approx=CCSD+xForCCSD;
% 
% CC=[...
% %-13481.657388185977  % RHF    
% CCS_approx; % approximation for CCS
% CCSD  % CCSD
% %-13482.173916820444 % CCSD(T)
% CCSDT  % CCSDT
% %-13482.181613872461 % CCSDT(Q)
% CCSDTQ];    % CCSDTQ
% 
% x=[x x(end)+x + 2*x(end)+x];
% %scatter(abs(diff(CC)),CC(2:end),250,'MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'Parent',axesCC,'Marker','s');
% scatter(abs(diff(CC))/2.5,CC(2:end),250,'MarkerEdgeColor','r','MarkerFaceColor','r');
% plot(x/2.5,x*slope +yIntercept,'LineWidth',5,'Color','r');
% 

%export_fig energies_with1b -pdf -eps -png
%%

%export_fig extrapolation_femoco_zoomed_10 -pdf -eps -png
%export_fig extrapolation_femoco_10_quadraticDashed -pdf -eps -png
%export_fig extrapolation_femoco_zoomed_10_quadraticDashed_cubicDotted -pdf -eps -png

%% 4 points

x=0:0.0001:(E_var(end-3)-E_tot(end-3));

f3 = polyfit(E_var((end-3):end)-E_tot((end-3):end),E_var((end-3):end),1);
f4 = polyfit(E_var((end-3):end)-E_tot((end-3):end),E_tot((end-3):end),1);

l3=f3(1)*x+f3(2);
l4=f4(1)*x+f4(2);

plotHandle1(6)=plot(x,l3,'b','LineWidth',5);
plotHandle1(7)=plot(x,l4,'b','LineWidth',5);

g3 = polyfit(E_var((end-3):end)-E_tot((end-3):end),E_var((end-3):end),2);
g4 = polyfit(E_var((end-3):end)-E_tot((end-3):end),E_tot((end-3):end),2);

q3=g3(1)*x.^2+g3(2)*x+g3(3);
q4=g4(1)*x.^2+g4(2)*x+g4(3);

plot(x,q3,'b--','LineWidth',5);
plot(x,q4,'b--','LineWidth',5);

h3 = polyfit(E_var((end-3):end)-E_tot((end-3):end),E_var((end-3):end),3);
h4 = polyfit(E_var((end-3):end)-E_tot((end-3):end),E_tot((end-3):end),3);

c3=h3(1)*x.^3 + h3(2)*x.^2 + h3(3)*x +h3(4);
c4=h4(1)*x.^3 + h4(2)*x.^2 + h4(3)*x +h4(4);

plot(x,c3,'b.','LineWidth',5);
plot(x,c4,'b.','LineWidth',5);

%% 2 points

x=0:0.0001:(E_var(end-1)-E_tot(end-1));

f5 = polyfit(E_var((end-1):end)-E_tot((end-1):end),E_var((end-1):end),1);
f6 = polyfit(E_var((end-1):end)-E_tot((end-1):end),E_tot((end-1):end),1);

l5=f5(1)*x+f5(2);
l6=f6(1)*x+f6(2);

plotHandle1(8)=plot(x,l5,'g','LineWidth',5);
plotHandle1(9)=plot(x,l6,'g','LineWidth',5);

g5 = polyfit(E_var((end-2):end)-E_tot((end-2):end),E_var((end-2):end),2);
g6 = polyfit(E_var((end-2):end)-E_tot((end-2):end),E_tot((end-2):end),2);

q5=g5(1)*x.^2+g5(2)*x+g5(3);
q6=g6(1)*x.^2+g6(2)*x+g6(3);

plot(x,q5,'g--','LineWidth',5);
plot(x,q6,'g--','LineWidth',5);

%% 3zeta
figure(2)

E_var=[-76.33080889 -76.33186406 -76.33218466];
E_tot=[-76.33255393 -76.332591 -76.33259937];

axes1=axes('Parent',figure1,'Position',[0.17103153393907 0.135620652855094 0.804917156600748 0.805924232322359]);   
hold(axes1,'on');

%hold('on')
%title('Energy of CAS(54,54) for FeMoco','interpreter','latex','FontSize',40);
xlabel('$E_{\textrm{var}}-E_{\textrm{tot}}$ (Hartree)','Interpreter','latex','FontSize',48);
ylabel('Energy (Hartree)','Interpreter','latex','FontSize',48),
yticklabels('auto');
box('on');grid('on');grid('minor');
set(gca,'XMinorTick','on','YMinorTick','on','LineWidth',2,'FontSize',30);
ax = gca;
ax.XAxis.TickLabelFormat = '%.0f';
ax.YAxis.TickLabelFormat = '%.8f';
ax.YRuler.Exponent = 0;

x=0:0.0001:(max(E_var-E_tot)+0.02);

% f1 = polyfit(E_var-E_tot,E_var,1);
% f2 = polyfit(E_var-E_tot,E_tot,1);

f1 = polyfitweighted(E_var-E_tot,E_var,1,1./(E_var-E_tot).^2);
f2 = polyfitweighted(E_var-E_tot,E_tot,1,1./(E_var-E_tot).^2);


l1=f1(1)*x+f1(2);
l2=f2(1)*x+f2(2);

plot(x,l1,'r--','LineWidth',5);
plot(x,l2,'r--','LineWidth',5);

% g1 = polyfit(E_var-E_tot,E_var,2);
% g2 = polyfit(E_var-E_tot,E_tot,2);

% g1 = polyfitweighted(E_var-E_tot,E_var,2,1./(E_var-E_tot).^2);
% g2 = polyfitweighted(E_var-E_tot,E_tot,2,1./(E_var-E_tot).^2);
% 
% q1=g1(1)*x.^2+g1(2)*x+g1(3);
% q2=g2(1)*x.^2+g2(2)*x+g2(3);
% 
% plotHandle(1)=plot(x,q1,'Color',[0.5 0.5 0.5],'LineWidth',5);
% plotHandle(2)=plot(x,q2,'Color',[  0   0   0]./255,'LineWidth',5);

% h1 = polyfit(E_var-E_tot,E_var,3);
% h2 = polyfit(E_var-E_tot,E_tot,3);
% 
% c1=h1(1)*x.^3 + h1(2)*x.^2 + h1(3)*x + h1(4);
% c2=h2(1)*x.^3 + h2(2)*x.^2 + h1(3)*x + h2(4);
% 

% Final energy with error bar

%scatter(0,-13482.181,200,'k','MarkerFaceColor','k');
%errorbar(0,mean([f6(2) f4(2) f2(2)]),0.001,'o','LineWidth',5,'MarkerSize',20,'MarkerFaceColor','k','Color','k','CapSize',20)
%errorbar(0,mean([f6(2) f4(2) f2(2)]),0.0001,'o','LineWidth',5,'MarkerSize',20,'MarkerFaceColor','k','Color','k','CapSize',20)

scatter(E_var-E_tot,E_var,250,'MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5]);
scatter(E_var-E_tot,E_tot,250,'MarkerEdgeColor',[0     0   0]./255,'MarkerFaceColor',[0 0 0]);

set(gcf, 'Color', 'w');
set(gcf,'renderer','Painters');

annotation(figure1,'textbox',[0.674669821176436 0.897627396605498 0.131316282511403 0.0569962544347223],'String','SHCI($E_\textrm{tot}$)','LineStyle','none','Interpreter','latex','FontSize',36,'FitBoxToText','off','BackgroundColor',[1 1 1]);
annotation(figure1,'textbox',[0.286107555008634 0.89866474100384 0.131316282511403 0.0569962544347223],'String','SHCI($E_\textrm{var}$)','LineStyle','none','Interpreter','latex','FontSize',36,'FitBoxToText','off','BackgroundColor',[1 1 1]);

hold('on')
ax_pos = ax.Position; 

%%
%axesCC = axes('Parent',figure1,'Position',[0.17103153393907 0.135620652855094 0.804917156600748 0.805924232322359],'XAxisLocation','top','Color','none');
%set(axesCC,'ytick',[],'XMinorTick','off','YMinorTick','off','LineWidth',2,'FontSize',30,'YTickLabel',[],'XTickLabel',[]);
%axesCC.XAxis.TickLabelFormat = '%.0f';
%axesCC.XRuler.Exponent = -5;
%axis([0 0.25 -13482.185 -13482.07]);

% CCSD=-13482.154243391968;
% CCSDT=-13482.177790577623;
% CCSDTQ=-13482.18178301;
% 
% slope=(CCSDT-CCSDTQ)/(CCSD-2*CCSDT+CCSDTQ);
% yIntercept = CCSDTQ - slope*(CCSDT-CCSDTQ);
% 
% xForCCSD=(CCSD-yIntercept)/slope;
% CCS_approx=CCSD+xForCCSD;
% 
% CC=[...
% %-13481.657388185977  % RHF    
% CCS_approx; % approximation for CCS
% CCSD  % CCSD
% %-13482.173916820444 % CCSD(T)
% CCSDT  % CCSDT
% %-13482.181613872461 % CCSDT(Q)
% CCSDTQ];    % CCSDTQ
% 
% x=[x x(end)+x + 2*x(end)+x];
% %scatter(abs(diff(CC)),CC(2:end),250,'MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'Parent',axesCC,'Marker','s');
% scatter(abs(diff(CC))/2.5,CC(2:end),250,'MarkerEdgeColor','r','MarkerFaceColor','r');
% plot(x/2.5,x*slope +yIntercept,'LineWidth',5,'Color','r');
% 
%%
%export_fig energies_with1b -pdf -eps -png