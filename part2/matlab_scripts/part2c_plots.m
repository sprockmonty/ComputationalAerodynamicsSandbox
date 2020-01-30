clear
clc
close all
cpViscX = readmatrix('../data/partc_data/Cp_visc_fine_04_x');
cpViscZ = readmatrix('../data/partc_data/Cp_visc_fine_04_z');
cpInviscX = readmatrix('../data/partc_data/Cp_invisc_fine_04_x');
cpInviscZ = readmatrix('../data/partc_data/Cp_invisc_fine_04_z');

data = [cpViscX,cpInviscX,cpViscZ,cpInviscZ];

plotNames = ["Cp Visc 0.4", "Cp Visc 0.925", "Cp Invisc 0.4", "Cp Invisc 0.925"];

figure
hold on
for i = 1:4
    cpX = data(:,2*i-1:2*i);
    cpX(any(isnan(cpX),2),:) = [];
    cpZ = data(:,2*i+7:2*i+8);
    cpZ(any(isnan(cpZ),2),:) = [];
    
    [cpUpper, cpLower] = clasifyPoints(cpX,cpZ);
    [dcp, range] = sortAndSpline(cpUpper, cpLower);
    plot(range, dcp)
end
legend(plotNames)


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

function [dcp,range] = sortAndSpline(cpUpper, cpLower)
    cpUpper = sortrows(cpUpper,1);
    cpLower = sortrows(cpLower,1);
    cpUpperFit = fit(cpUpper(:,1),cpUpper(:,2),'smoothingspline');
    cpLowerFit = fit(cpLower(:,1),cpLower(:,2),'smoothingspline');
    minx = min([cpUpper(1,1),cpLower(1,1)]);
    maxx = max([cpUpper(end,1),cpLower(end,1)]);
    range = minx:(maxx-minx)/1000:maxx;
    dcp = abs(cpUpperFit(range)-cpLowerFit(range));
end