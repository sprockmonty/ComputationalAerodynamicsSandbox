clear
clc
close all
baseVals = [4,5,10,20,30,40,50,60,70,80,90,100,150,200,250,300,350,400,450,500,550,600,650,700,750,800,850,900,950,1000,1050,1100,1150,1200];
ClCd = zeros(length(baseVals),2);
Cp = cell(length(baseVals),1);

for i = 1:length(baseVals)
    tempClCd = readmatrix(['../data/part1c_data/ClCd',num2str(baseVals(i)),'.csv']);
    ClCd(i,:) = tempClCd(end,2:3);
    Cp{i} = readmatrix(['../data/part1c_data/Cp',num2str(baseVals(i)),'.csv']);
    if i > 1
        ClCdDiff(i,:) = abs((ClCd(i-1,:) - ClCd(i,:)) ./ ClCd(i,:) );
    end
end

figure
subplot(2,1,1);
plot(baseVals/10000,ClCd(:,1), 'LineWidth',1.5, 'Color','k')
title("C_D")
xlabel("Base Size (m)")
ylabel("C_D")
grid on

subplot(2,1,2);
plot(baseVals/10000,ClCdDiff(:,1), 'LineWidth',1.5, 'Color','k')
title("C_D % difference")
xlabel("Base Size (m)")
ylabel("% Difference")
grid on
saveas(gcf,'plots/part2c_plots/CD_base','epsc')

figure
subplot(2,1,1);
plot(baseVals/10000,ClCd(:,2), 'LineWidth',1.5, 'Color','k')
title("C_L")
xlabel("Base Size (m)")
ylabel("C_L")
grid on

subplot(2,1,2); 
plot(baseVals/10000,ClCdDiff(:,2), 'LineWidth',1.5, 'Color','k')
title("C_L % Difference")
xlabel("Base Size (m)")
ylabel("% Difference")
grid on
saveas(gcf,'plots/part2c_plots/CL_base','epsc')

% xfoil plots
xfoilData = readmatrix('../data/part1c_data/AG16_polar.csv');
xfoilAlpha = xfoilData(6:end,1);
xfoilCl = xfoilData(6:end,2);
xfoilCd = xfoilData(6:end,3);


left_color = [1 0.2 0.2];
right_color = [0 0 0];
set(figure(6),'defaultAxesColorOrder',[left_color; right_color]);
hold on
grid on
yyaxis left
plot(xfoilAlpha,xfoilCl, '-r','LineWidth',1.5);
ylabel('C_L');
yyaxis right
plot(xfoilAlpha,xfoilCd, '-k','LineWidth',1.5);
ylabel('C_D');
xlabel('Angle of Attack');
xlim([0 10]);
legend('C_L Xfoil','C_D Xfoil','Location','southeast');
title('Coefficient plots for XFOIL viscous AG16 airfoil');
saveas(gcf,'plots/part2c_plots/xfoil_ag16','epsc')
