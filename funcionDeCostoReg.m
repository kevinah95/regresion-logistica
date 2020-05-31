function [J, grad] = funcionDeCostoReg(theta, X, y, lambda)
%FUNCIONDECOSTOREG Calcula el costo y el gradiente para regresión logística
%   con regularización
%   J = FUNCIONDECOSTOREG(theta, X, y, lambda) calcula el costo de utilizar
%   theta como parámetro para la regresión logística regularizada

% Initialice algunos valores útiles
m = length(y); % número de pares de entrenamiento

% Tiene que poner los valores correctos en las siguientes variables
J = 0;
grad = zeros(size(theta));

% ====================== SU CÓDIGO AQUÍ ======================
% Instrucciones: Calcule el costo para una selección particular de theta.
%                Guarde el costo en J.
%                Calcule las derivadas parciales de theta y guardelas en grad
% 



h_theta = sigmoid(X*theta);

J = (-y' * log(h_theta) - (1-y)' * log(1-h_theta))/m + lambda/2/m*theta(2:end)'*theta(2:end);

grad = X'*(h_theta - y)/m + lambda*theta/m;

grad(1) -= lambda*theta(1)/m;




% =============================================================

end
