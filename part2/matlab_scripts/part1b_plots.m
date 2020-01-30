clear
clc
close all
radiVals = [250,230,220,210,200,180,170,160,150,130,100,80,70,60,50,40,35,30,25,20,15,12,11,10,9,8,7,6,5,4,3];
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
