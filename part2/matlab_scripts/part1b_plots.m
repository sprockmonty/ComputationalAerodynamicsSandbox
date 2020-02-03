clear
clc
close all
radiVals = [3,4,5,6,7,8,9,10,11,12,15,20,25,30,35,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,250];
radiVals = [radiVals,230,250]
ClCd = zeros(length(radiVals),2);
Cp = cell(length(radiVals),1);

for i = 1:length(radiVals)
    tempClCd = readmatrix(['../data/part1b_data/ClCd',num2str(radiVals(i)),'.csv']);
    ClCd(i,:) = tempClCd(end,2:3);
    Cp{i} = readmatrix(['../data/part1b_data/Cp',num2str(radiVals(i)),'.csv']);
    if i > 1
        ClCdDiff(i,:) = abs((ClCd(i-1,:) - ClCd(i,:)) ./ ClCd(i,:) );
    end
end

figure
subplot(2,1,1);
plot(radiVals,ClCd(:,1), 'LineWidth',1.5, 'Color','k')
title("C_D")
xlabel("Domain Radius (m)")
ylabel("C_D")
grid on

subplot(2,1,2);
plot(radiVals,ClCdDiff(:,1), 'LineWidth',1.5, 'Color','k')
title("C_D % difference")
xlabel("Domain Radius (m)")
ylabel("% Difference")
grid on
saveas(gcf,'plots/part2b_plots/CD_radi','epsc')


figure
subplot(2,1,1);
plot(radiVals,ClCd(:,2), 'LineWidth',1.5, 'Color','k')
title("C_L")
xlabel("Domain Radius (m)")
ylabel("C_L")
grid on

subplot(2,1,2); 
plot(radiVals,ClCdDiff(:,2), 'LineWidth',1.5, 'Color','k')
title("C_L % Difference")
xlabel("Domain Radius (m)")
ylabel("% Difference")
grid on
saveas(gcf,'plots/part2b_plots/CD_radi','epsc')

