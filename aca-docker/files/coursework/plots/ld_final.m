%%

close all
clc
clear all

load('ldmax')
a = ldmax{:,1};
cl = ldmax{:,3};
cd = ldmax{:,2};
ld = cl./cd;

figure(6)
hold on
plot(a,ld(:,1), '.k','LineWidth',1);
grid on
set(gca,'fontsize',18)
%plot(5.0400, 19.7614, 'xk');


hold off
[m, i] = max(ld(:,1));
[a(i,1), m]
xlabel("\alpha (\circ)")
ylabel("L/D")
