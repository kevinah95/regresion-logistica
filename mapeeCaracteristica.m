function out = mapeeCaracteristica(X1, X2)
% MAPFEATURE Feature mapping function to polynomial features
%
%   MAPEECARACTERISTICA(X1, X2) mapea dos caracteristicas 
%   a características cuadráticas en el ejercicio de regularización
%   
%   Returns un nuevo vector de características con 
%   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
%
%   X1, X2 deben ser del mismo tamaño
%

degree = 6;
out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

end
