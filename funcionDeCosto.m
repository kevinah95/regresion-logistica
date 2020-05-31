function [J, grad] = funcionDeCosto(theta, X, y)
%FUNCIONDECOSTO Calcula el costo y el gradiente para regresión logística
%   J = FUNCIONDECOSTO(theta, X, y) calcula el costo utilizando theta
%   como el parámetro para regresión logística

% Inicializar algunos valores útiles
m = length(y); % número de pares de entrenamiento

% Necesita devolver las siguientes variables con el valor correcto
J = 0;
grad = zeros(size(theta));

% ====================== SU CÓDIGO AQUÍ ======================
% Instrucciones: Calcula el costo para un vector específico de theta
%                Usted debe poner el costo en J.
%                Calcular las derivadas parciales con respecto a theta
%                y guardarlas en grad
%
% Nota: grad debe tener la misma dimensión que theta
%


h_theta = sigmoid(X*theta);

J = (-y' * log(h_theta) - (1-y)' * log(1-h_theta))/m;

grad = X' * (h_theta - y)/m;




% =============================================================

end
