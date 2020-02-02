close all; clear all; clc;

%% AVL
raw = csvread('Tine3.csv');

CL_sectional_AVL=raw(:,8);
y_sectional_AVL=raw(:,2)./457.2;

CC_l_AVL=raw(:,5);
C_ref_AVL=152.4;

CC_l_second_AVL=CC_l_AVL/C_ref_AVL;




%% Experimental
DATA=[0.167 0.138
0.250 0.162
0.400 0.172
0.600 0.186
0.750 0.191
0.850 0.183
0.925 0.165];

Cy_exp=DATA(:,1);
CN_exp=DATA(:,2);


y=linspace(0.167,0.925,100)
%yy=spline(Ct,CN,y)


CL_exp=CN_exp*cosd(2);


Chord_experimental=-(1/3)*Cy_exp*457.2+228.6;
second_experimental=CL_exp.*Chord_experimental/C_ref_AVL;

coeff = polyfit(Cy_exp, CL_exp, 3);
CL_span = polyval(coeff, y);

figure(1)
hold on
hhh(1)=plot(y_sectional_AVL,CL_sectional_AVL,'r','LineWidth',1)
hhh(2)=plot(Cy_exp,CL_exp,'k','LineWidth',1)


leg1=legend([hhh],'Trefftz','Experimental')
xlabel('y/s','Interpreter','latex') %'$\frac{y}{s}$
ylabel('Sectional Lift Coefficient $C_{l}$ ','Interpreter','latex')
grid on
set(gca,'fontsize',18)

hold off



figure(2)
hold on
grid on
hh(1)=plot(y_sectional_AVL,CC_l_second_AVL,'r','LineWidth',1)
hh(2)=plot(Cy_exp,second_experimental,'k','LineWidth',1)
leg2=legend([hh],'Trefftz','Experimental')
xlabel('y/s','Interpreter','latex') %'$\frac{y}{s}$
ylabel('Lift Distribution $C_{l}$ $\frac{c}{c_{ref}}$ ','Interpreter','latex')
set(gca,'fontsize',18)
hold off



% LL=trapz(Cy_exp,CL_exp)*914.4/100