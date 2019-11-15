clear
clc
close all
load("avl.mat")


%cl plot
figure
hold on
plot(ratio2{:,1}.*ratio2{:,2}, ratio2{:,3},'LineWidth',1)
plot(ratio4{:,1}.*ratio4{:,2}, ratio4{:,3},'LineWidth',1)
plot(ratio6{:,1}.*ratio6{:,2}, ratio6{:,3},'LineWidth',1)
plot(ratio8{:,1}.*ratio8{:,2}, ratio8{:,3},'LineWidth',1)
plot(ratio10{:,1}.*ratio10{:,2}, ratio10{:,3},'LineWidth',1)
xlabel("Mesh Size")
ylabel("C_L")
legend("Ratio: 2", "Ratio: 4", "Ratio: 6", "Ratio: 8", "Ratio: 10");
set(gca,'fontsize',18)
grid on;


%cd plot
figure
hold on
plot(ratio2{:,1}.*ratio2{:,2}, ratio2{:,4},'LineWidth',1)
plot(ratio4{:,1}.*ratio4{:,2}, ratio4{:,4},'LineWidth',1)
plot(ratio6{:,1}.*ratio6{:,2}, ratio6{:,4},'LineWidth',1)
plot(ratio8{:,1}.*ratio8{:,2}, ratio8{:,4},'LineWidth',1)
plot(ratio10{:,1}.*ratio10{:,2}, ratio10{:,5},'LineWidth',1)
xlabel("Mesh Size")
ylabel("C_D")
legend("Ratio: 2", "Ratio: 4", "Ratio: 6", "Ratio: 8", "Ratio: 10");
set(gca,'fontsize',18)
grid on;




