function grafiqueDatos(X, y)
%GRAFIQUEDATOS grafica los datos X , y en una figura nueva
%   GRAFIQUEDATOS(x,y) grafica los datos con + para los ejemplos positivos
%   y o para ejemplos negativos. Se asume que X es una matriz de Mx2.

% Genere una figura nueva
figure; hold on;

% ====================== SU CÓDIGO AQUÍ ======================
% Instrucciones: Grafique los ejemplos positivos y negativos en un
%                gráfico 2D, utilizando 'k+' para los ejemplos
%                positivos y for the positivos y 'ko' par los negativos
%


pos = find(y == 1);
neg = find(y == 0);

plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 1,'MarkerSize', 3);
plot(X(neg, 1), X(neg, 2), 'ko','MarkerFaceColor', 'y', 'MarkerSize', 3);





% =========================================================================



hold off;

end
