function grafiqueFrontera(theta, X, y)
%GRAFIQUEFRONTERA Grafica los datos X, y en una nueva figura
%   con frontera de decisión determinada por 
%   GRAFIQUEDATOS(theta, X,y) grafica los datos con + para los positivos
%   y o para los negativos. X se asume que es o bien
%
%   1) Una matriz Mx3, donde la primer columna es de solo unos.
%   2) MxN, con N>3, donde la primer columna es solo unos.

% grafique los Datos
grafiqueDatos(X(:,2:3), y);
hold on

if size(X, 2) <= 3
    % Solo se ocupan 2 puntos para definir una linea
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

    % Calcule la frontera de decisión
    plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));

    % Grafique y ajuste los ejes para ver mejor
    plot(plot_x, plot_y)
    
    legend('Admitido', 'No admitido', 'Frontera')
    axis([30, 100, 30, 100])
else
    % Aquí va el rango de la grilla
    u = linspace(-1, 1.5, 50);
    v = linspace(-1, 1.5, 50);

    z = zeros(length(u), length(v));
    % Evalue z = theta*x en la grilla
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = mapeeCaracteristica(u(i), v(j))*theta;
        end
    end
    z = z'; % importante transponer z antes de llamar a contour

    % Grafique z = 0
    % Note que necesita especificar el rango [0, 0]
    contour(u, v, z, [0, 0], 'LineWidth', 2)
end
hold off

end
