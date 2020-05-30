%% Exercicio 2: Regresión Logística
%
%  Instrucciones
%  -------------
% 
%  Este archivo contiene código que le ayuda a empezar con la segunda parte
%  del ejercicio que cubre regularización con regresión logística.
%
%  Necesitará completar las siguientes funciones en este ejercicio:
%
%     sigmoide.m
%     funcionDeCosto.m
%     prediccion.m
%     funcionDeCostoReg.m
%
%  Para este ejercicio NO tendrá que cambiar código de este archivo,
%  o cualquier otro que no se encuentre en la lista anterior.
%

%% Inicialización
clear ; close all; clc

%% Cargue los Datos
%  Las primeras dos columnas contienen los valores de X y la tercera
%  contiene la etiqueta (y).

data = load('ex2data2.txt');
X = data(:, [1, 2]); y = data(:, 3);

grafiqueDatos(X, y);

% Ponga algunas etiquetas 
hold on;

% Etiquetas
xlabel('Prueba de Microchip 1')
ylabel('Prueba de Microchip 2')

% Especificados en orden de graficación
legend('y = 1', 'y = 0')
hold off;


%% =========== Parte 2: Regresión Logística Regularizada  ============
%  En esta parte, se le da un conjunto de datos que no son separables
%  linealmente. Sin embargo, usted todavía le gustaría utilizar
%  regresión logística para clasificar los datos.
%
%  Para lograrlo, usted introduce más características  -- en particular, 
%  agrega características polinomiales a la matriz de datos
%  (similar a regresión polinomial).
%

% Agregue Características Polinomiales

% Note que mapeeCaracteristica también agrega una columna de unos
% así que aquí no hace falta

X = mapeeCaracteristica(X(:,1), X(:,2));

% Inicialice los parámetros
theta_inicial = zeros(size(X, 2), 1);

% Ponga el parámetro de regularización a lambda = 1
lambda = 1;

% Calcule y despliegue el costo inicial y el gradiente para regresión
% logística regularizada
[costo, grad] = funcionDeCostoReg(theta_inicial, X, y, lambda);

fprintf('Costo inicial de en theta (ceros): %f\n', costo);

fprintf('\nPrograma en pausa. Oprima enter para continuar.\n');
%pause;

%% ============= Part 2: Regularización y Precisión =============
%  En esta parte, usted intentara valores distintos de lambda y 
%  verá como la regularización afecta la frontera de decisión
%
%  Pruebe con los siguientes valores de lambda (0, 1, 10, 100).
%
%  ¿Cómo cambia la frontera de decisión cuando cambia lambda?
%  ¿Cómo cambia la precisión en el conjunto de aprendizaje?
%

% Inicialice los parámetros
theta_inicial = zeros(size(X, 2), 1);

% Ponga el parámetro de regularización en 1 (lo debe variar)
lambda = 1;

% Ponga opciones
opciones = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimice
[theta, J, bandera_exit] = ...
	fminunc(@(t)(funcionDeCostoReg(t, X, y, lambda)), theta_inicial, opciones);

% Grafique la frontera
grafiqueFrontera(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))

% Etiquetas
xlabel('Test de Microchip 1')
ylabel('Test de Microchip 2')

legend('y = 1', 'y = 0', 'Frontera de Decisión')
hold off;

% Calcule la precisión en el set de entrenamiento
p = prediccion(theta, X);

fprintf('Precisión en Entrenamiento: %f\n', mean(double(p == y)) * 100);

