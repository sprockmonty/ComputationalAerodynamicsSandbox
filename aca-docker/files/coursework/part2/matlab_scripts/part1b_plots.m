clear
clc
close all
radiVals = [150,130,100,80,60,50,40,30,20,10,8,5];
ClCd = zeros(length(radiVals),2);
Cp = cell(length(radiVals),1);

for i = 1:length(radiVals)
    tempClCd = readmatrix(['../data/part1b_data/ClCd',num2str(radiVals(i)),'.csv']);
    ClCd(i,:) = tempClCd(end,2:3);
    Cp{i} = readmatrix(['../data/part1b_data/Cp',num2str(radiVals(i)),'.csv']);
end

figure
plot(radiVals,ClCd(:,1))
figure
plot(radiVals,ClCd(:,2))