clear
clc
close all
load('../data/partc_data/expAndAvl.mat')
cpViscX = readmatrix('../data/partc_data/Cp_visc_fine_08_x');
cpViscZ = readmatrix('../data/partc_data/Cp_visc_fine_08_z');
cpInviscX = readmatrix('../data/partc_data/Cp_invisc_fine_08_x');
cpInviscZ = readmatrix('../data/partc_data/Cp_invisc_fine_08_z');

data = [cpViscX,cpInviscX,cpViscZ,cpInviscZ];

plotNames = ["Experimental", "Viscous", "Invisid"];
plotColours = ['kkrr'];
figure
%img = imread('../data/partc_data/duck.PNG');
%image('CData',img,'XData',[0.13-.1 0.4-.09],'YData',[0.65+0.07 -1.05+0.07])
hold on
grid on
p = [];

%Experimental plot
cpExp04(:,1) = cpExp04(:,1)*(dcpAVL(end,1)-dcpAVL(1,1)) + dcpAVL(1,1);
cpExp0925(:,1) = cpExp0925(:,1)*(dcpAVL(end,3)-dcpAVL(1,3)) + dcpAVL(1,3);

%top
p = [p,plot(cpExp04(:,1),-cpExp04(:,2),'--','LineWidth',1.5,'Color','#D95319')];
plot(cpExp0925(:,1),-cpExp0925(:,2),'--','LineWidth',1.5,'Color','#D95319')

%bottom
plot(cpExp04(:,1),-cpExp04(:,3),'--','LineWidth',1.5,'Color','#D95319')
plot(cpExp0925(:,1),-cpExp0925(:,3),'--','LineWidth',1.5,'Color','#D95319')

for i = 1:4
    cpX = data(:,2*i-1:2*i);
    cpX(any(isnan(cpX),2),:) = [];
    cpZ = data(:,2*i+7:2*i+8);
    cpZ(any(isnan(cpZ),2),:) = [];
    
    [cpUpper, cpLower] = clasifyPoints(cpX,cpZ);
    cpUpper = sortrows(cpUpper,1);
    cpLower = sortrows(cpLower,1);
    if mod(i,2)
        p = [p,plot(cpUpper(:,1), -cpUpper(:,2),'x-','LineWidth',1.5,'Color',plotColours(i))];
        plot(cpLower(:,1), -cpLower(:,2),'x-','LineWidth',1.5,'Color',plotColours(i))
    else
        plot(cpUpper(:,1), -cpUpper(:,2),'x-','LineWidth',1.5,'Color',plotColours(i))
        plot(cpLower(:,1), -cpLower(:,2),'x-','LineWidth',1.5,'Color',plotColours(i))
        
    end
end
legend(p,plotNames)
title("Comparison of C_P between Star CCM and experimental data ")
ylabel("- C_P")
xlabel("Chordwise position (m)")
xlim([0.13,0.41])
set(gca,'FontSize',20)
set(gcf,'Position',[0 0 1300 800])
saveas(gcf,'plots/partc_plots/cp08','epsc')


function [cpUpper, cpLower] = clasifyPoints(cpX, cpZ)
    for i = 1:size(cpX,1)
        index = find(cpX(i,2)==cpZ(:,2));
        if cpZ(index,1) >= 0
            cpX(i,3) = 1;
        else
            cpX(i,3) = -1;
        end
    end
    cpUpper = cpX(cpX(:,3)==1,1:2);
    cpLower = cpX(cpX(:,3)==-1,1:2);
end
