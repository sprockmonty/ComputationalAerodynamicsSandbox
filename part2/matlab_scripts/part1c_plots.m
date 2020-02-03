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
xlim([0,0.04])

subplot(2,1,2);
plot(baseVals/10000,ClCdDiff(:,1), 'LineWidth',1.5, 'Color','k')
title("C_D % difference")
xlabel("Base Size (m)")
ylabel("% Difference")
grid on
xlim([0,0.04])
saveas(gcf,'plots/part2c_plots/CD_base','epsc')

figure
subplot(2,1,1);
plot(baseVals/10000,ClCd(:,2), 'LineWidth',1.5, 'Color','k')
title("C_L")
xlabel("Base Size (m)")
ylabel("C_L")
grid on
xlim([0,0.04])

subplot(2,1,2); 
plot(baseVals/10000,ClCdDiff(:,2), 'LineWidth',1.5, 'Color','k')
title("C_L % Difference")
xlabel("Base Size (m)")
ylabel("% Difference")
grid on
xlim([0,0.04])
saveas(gcf,'plots/part2c_plots/CL_base','epsc')

