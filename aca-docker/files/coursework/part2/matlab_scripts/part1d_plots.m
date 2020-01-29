clear
clc
close all
aoaVals = [0,2,4,6,8];
ClCd = zeros(length(aoaVals),2);

for i = 1:length(aoaVals)
    tempClCd = readmatrix(['../data/part1d_data/ClCd',num2str(aoaVals(i)),'.csv']);
    ClCd(i,:) = tempClCd(end,2:3);
end

figure
plot(aoaVals,ClCd(:,1), 'LineWidth',1.5, 'Color','k')
title("C_D")
xlabel("Angle of Attack (degrees)")
ylabel("C_D")
grid on
saveas(gcf,'plots/part2d_plots/CD_aoa','epsc')


figure
plot(aoaVals,ClCd(:,2), 'LineWidth',1.5, 'Color','k')
title("C_L")
xlabel("Angle of Attack (degrees)")
ylabel("C_L")
grid on
saveas(gcf,'plots/part2d_plots/CL_aoa','epsc')

residual4 = readmatrix(['../data/part1d_data/residual4.csv']);
residualNames = ["Continuity","X-momentum","Y-momentum","Energy","Tke","Sdr"];
residualColour = ['r','b','m','k','g','c'];
figure
for i = 1:length(residualNames)
    semilogy(residual4(:,1),residual4(:,i+1),'LineWidth',1.5,'color',residualColour(i))
    hold on
end
legend(residualNames)
title("Residuals")
xlabel("Iteration")
ylabel("Residual")
saveas(gcf,'plots/part2d_plots/residuals4','epsc')

figure
ClCd4Conv = readmatrix(['../data/part1d_data/ClCd4.csv']);
plot(ClCd4Conv(:,1),ClCd4Conv(:,2),'k','LineWidth',1.5)
hold on
plot(ClCd4Conv(:,1),ClCd4Conv(:,3),'r','LineWidth',1.5)
title("Coefficent Convergence")
xlabel("Iteration")
ylabel("Coefficient Value")
legend(["C_D","C_L"])
saveas(gcf,'plots/part2d_plots/ClCdConv','epsc')

