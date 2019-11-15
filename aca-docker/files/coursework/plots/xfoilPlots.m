clear
clc
close all
load("xfoilFirst.mat")
plot(invicidLowReCp{:,1}, -invicidLowReCp{:,2} ,'-k','LineWidth',1)
hold on
plot(vicidLowReCp{:,1}, -vicidLowReCp{:,2} ,'-r','LineWidth',1)
set(gca,'fontsize',18)
grid on;
xlabel("x/c")
ylabel("-C_p")
legend("Inviscid Study", "Viscous Study");

figure
plot(vicidLowReCf{:,1}, vicidLowReCf{:,2} ,'-k','LineWidth',1)
hold on
set(gca,'fontsize',18)
grid on;
xlabel("x/c")
ylabel("C_f")

figure
xc = vicidLowReCf{:,1};
plot(xc(1:141), vicidLowReDTheta{:,1} ,'-k','LineWidth',1)
hold on
plot(xc(1:141), vicidLowReDTheta{:,2} ,'-r','LineWidth',1)
set(gca,'fontsize',18)
grid on;
xlabel("x/c")
ylabel("\delta, \theta")
legend("\delta", "\theta");

load("experimental.mat")
%alfa cl cd
figure
hold on
plot(HighRePol{:,1}, HighRePol{:,2} ,'-k','LineWidth',1)
plot(Experimental(:,1), Experimental(:,2) ,'-r','LineWidth',1)
set(gca,'fontsize',18)
grid on;
xlabel("\alpha (\circ)")
ylabel("C_L")
legend("XFoil Data", "Experimental Data");

%get dCl da
cl = HighRePol{:,2};
alfa = HighRePol{:,1};
polyfit(alfa(1:237),cl(1:237),1)
polyfit(Experimental(1:14,1),Experimental(1:14,2),1)

figure
hold on
plot(HighRePol{:,3}, HighRePol{:,2} ,'-k','LineWidth',1)
plot(Experimental(:,3), Experimental(:,2) ,'-r','LineWidth',1)
set(gca,'fontsize',18)
grid on;
xlabel("C_D")
ylabel("C_L")
legend("XFoil Data", "Experimental Data");

figure
hold on
plot(HighRePol{:,1}, HighRePol{:,2} ./  HighRePol{:,3},'-k','LineWidth',1)
plot(Experimental(:,1), Experimental(:,2) ./  Experimental(:,3) ,'-r','LineWidth',1)
set(gca,'fontsize',18)
grid on;
ylabel("L/D")
xlabel("\alpha (\circ)")
legend("XFoil Data", "Experimental Data");
%max ld
max(HighRePol{:,2} ./  HighRePol{:,3})







