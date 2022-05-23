close all
clear variables
clc

data = importdata('BD_AMPA_MAX.csv'); % Pool of maximum currents evoked by BD-CreER+ inputs 
data_cart = importdata('CART_AMPA_MAX.csv'); % Pool of maximum currents evoked by CART-Cre+ inputs
TC_total = 1000; 
Nonspec_frac = 0.2726;  % Fraction of nonspecific labelling in RGC_CART-Cre mice
BD_frac = (1 - Nonspec_frac) * 0.494; % Fraction of ventral ooDSGCs 
Dors_frac = (1 - Nonspec_frac) * 0.506; % Fraction of dorsal ooDSGCs

RGC_Nonspec = [];
RGC_BD = [];
RGC_Dors = [];
RGC_CART = [];
CART = [];

i = 1;
while i <= TC_total 
    RGC_Nonspec (i) = data(randi(size(data,1)));
    RGC_Dors (i) = data(randi(size(data,1)));
    RGC_BD (i) = data(randi(size(data,1)));
    RGC_CART (i) = RGC_Nonspec (i) + RGC_Dors (i) + RGC_BD (i);
    CART(i) = data_cart(randi(size(data_cart,1)));
    i = i+1;
end

RGC_CART_plot = cdfplot (RGC_CART);
hold on;
BD_plot = cdfplot (RGC_BD);
hold on;
set (RGC_CART_plot, 'LineWidth', 3, 'Color', 'R');
set (BD_plot, 'LineWidth', 3, 'Color', 'B');
set(gca, 'LineWidth', 2);
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 20);
box off
grid off
xlabel('EPSC Maximal Amplitude (nA)','FontSize',20);
ylabel('Cumulative probability','FontSize',20);
legend([RGC_CART_plot BD_plot], 'CART', 'BD', 'Location', 'best')
%legend("");
legend boxoff
title("");

nor_RGC_CART = RGC_CART / max (RGC_CART);
nor_RGC_BD = RGC_BD / max (RGC_BD);
nor_CART = CART / max (CART);

figure (2);
nor_RGC_CART_plot = cdfplot (nor_RGC_CART);
hold on;
nor_BD_plot = cdfplot (nor_RGC_BD);
set (nor_RGC_CART_plot, 'LineWidth', 3, 'Color', 'R');
set (nor_BD_plot, 'LineWidth', 3, 'Color', 'B');
set(gca, 'LineWidth', 2);
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 20);
box off
grid off
xlabel('Normalized EPSC Amplitude','FontSize',20);
ylabel('Cumulative probability','FontSize',20);
legend([nor_RGC_CART_plot nor_BD_plot], 'CART', 'BD', 'Location', 'best')
%legend ("");
legend boxoff
title("");

j = 1;
i = 1;
while j <= length (RGC_CART)
    if RGC_CART (j) > 0
        RGC_CART_nonZ (i) = RGC_CART (j);
        i = i+1;
    else
    end
    j = j+1;
end

j = 1;
i = 1;
while j <= length (RGC_BD)
    if RGC_BD (j) > 0
        RGC_BD_nonZ (i) = RGC_BD (j);
        i = i+1;
    else
    end
    j = j+1;
end

j = 1;
i = 1;
while j <= length (RGC_Dors)
    if RGC_Dors (j) > 0
        RGC_Dors_nonZ (i) = RGC_Dors (j);
        i = i+1;
    else
    end
    j = j+1;
end

figure (3);
RGC_CART_nonZ_plot = cdfplot (RGC_CART_nonZ);
hold on;
RGC_BD_nonZ_plot = cdfplot (RGC_BD_nonZ);
set (RGC_CART_nonZ_plot, 'LineWidth', 3, 'Color', 'R');
set (RGC_BD_nonZ_plot, 'LineWidth', 3, 'Color', 'B');
set(gca, 'LineWidth', 2);
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 20);
box off
grid off
xlabel('EPSC Maximal Amplitude (nA)','FontSize',20);
ylabel('Cumulative probability','FontSize',20);
legend([RGC_CART_nonZ_plot RGC_BD_nonZ_plot], 'CART', 'BD', 'Location', 'best')
%legend("");
legend boxoff
title("");

j = 1;
i = 1;
while j <= length (nor_RGC_CART)
    if nor_RGC_CART (j) > 0
        nor_RGC_CART_nonZ (i) = nor_RGC_CART (j);
        i = i+1;
    else
    end
    j = j+1;
end

j = 1;
i = 1;
while j <= length (nor_RGC_BD)
    if nor_RGC_BD (j) > 0
        nor_RGC_BD_nonZ (i) = nor_RGC_BD (j);
        i = i+1;
    else
    end
    j = j+1;
end

j = 1;
i = 1;
while j <= length (nor_CART)
    if nor_CART (j) > 0
        nor_CART_nonZ (i) = nor_CART (j);
        i = i+1;
    else
    end
    j = j+1;
end

figure (4);
nor_RGC_CART_nonZ_plot = cdfplot (nor_RGC_CART_nonZ);
hold on;
nor_RGC_BD_nonZ_plot = cdfplot (nor_RGC_BD_nonZ);
hold on;
nor_CART_nonZ_plot = cdfplot (nor_CART_nonZ);
set (nor_RGC_CART_nonZ_plot, 'LineWidth', 3, 'Color', 'R');
set (nor_RGC_BD_nonZ_plot, 'LineWidth', 3, 'Color', 'B');
set (nor_CART_nonZ_plot, 'LineWidth', 3, 'Color', 'k');
set(gca, 'LineWidth', 2);
set(gca, 'FontName', 'Arial');
set(gca, 'FontSize', 20);
box off
grid off
xlabel('Normalized EPSC Amplitude','FontSize',20);
ylabel('Cumulative probability','FontSize',20);
legend([nor_RGC_CART_nonZ_plot nor_CART_nonZ_plot nor_RGC_BD_nonZ_plot], 'CART_pred', 'CART_expt', 'BD', 'Location', 'best');
%legend("");
legend boxoff
title("");
[nor_nonZ_h1,p1] = kstest2 (nor_RGC_CART_nonZ, nor_RGC_BD_nonZ);
[nor_nonZ_h2,p2] = kstest2 (nor_RGC_CART_nonZ, nor_CART_nonZ);
[nor_nonZ_h3,p3] = kstest2 (nor_RGC_BD_nonZ, nor_CART_nonZ);
test_result = [nor_nonZ_h1, p1; nor_nonZ_h2, p2;nor_nonZ_h3,p3];
