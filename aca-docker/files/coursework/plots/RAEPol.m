clear
clc

figure
data = csvread("VISH_CDCL.csv")
cd = data(:,3)
cl = data(:,2)
plot(cd, cl, 'k','LineWidth',1)
hold on 
set(gca,'fontsize',18)
grid on;
coef = polyfit(cl(51:123,:), cd(51:123,:), 2)
x = [-1:0.01:1]
curve = polyval(coef,x)
plot(curve, x, 'r','LineWidth',1)
scatter([0.010097, 0.0096554,0.010097],[-0.45,0,0.45], "x")
legend("XFOIL Polar","2nd Order Approximation", "CLCD Points")
ylabel("C_L")
xlabel("C_D")