function p = prediccion(theta, X)
%PREDICCION Predice si la etiqueta debe ser 0 o 1 utilizando los
%parámetros aprendidos utilizando regresión logística
%   p = PREDICCION(theta, X) calcula predicciones para X utilizando un
%   umbral en 0.5 (i.e., si sigmoide(theta'*x) >= 0.5, la predicción es 1)

m = size(X, 1); % Número de pares de entrenamiento

% Usted necesita devolver la siguiente varieble con el valor correcto
p = zeros(m, 1);

% ====================== SU CÓDIGO AQUÍ ======================
% Instrucciones: Complete el código siguiente para hacer predicciones
%                utilizando regresión logística, debe dejar a p como
%                un vector de 1's y 0's
%
%


% Valores útiles
m = size(X, 1);
num_labels = size(Theta2, 1);

% Necesita retornar las siguiente variable correctamente
p = zeros(size(X, 1), 1);

h1 = sigmoide([ones(m, 1) X] * Theta1');
h2 = sigmoide([ones(m, 1) h1] * Theta2');
[dummy, p] = max(h2, [], 2);




% =========================================================================


end
