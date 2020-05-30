%% Ejercicio 2 - Regresión Logística
%
%  Instrucciones
%  ------------
% 
%  Este archivo contiene codigo que le ayuda a empezar los ejercicios de
%  regresión logística. Necesitará completar las siguientes funciones:
%
%     sigmoide.m
%     funcionDeCosto.m
%     prediccion.m
%     funcionDeCostoReg.m
%
%  Para este ejercicio, no necesita cambiar nada en este archivo 
%  o en algún archivo que no este mencionado arriba.
%

%% Inicialización
clear ; close all; clc

%% Cargar Datos
%  Las primeras dos columnas contienen los puntajes de los exámenes
%  la tercera contiene las etiquetas.

data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

%% ==================== Parte 1: Graficar ====================
%  Empezamos graficando los datos para entender el problema con
%  el que estamos trabajando.

fprintf(['Graficando los datos con + indicando pares donde (y = 1) y con o ' ...
         ' indicando pares donde (y = 0).\n']);

grafiqueDatos(X, y);

% Ponga algunas etiquetas
hold on;
% Etiquetas y textos 
xlabel('Puntaje Examen 1')
ylabel('Puntaje Examen 2')

% Especificados en orden de grafocación 
legend('Admitido', 'No admitido')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
%pause;


%% ============ Parte 2: Calcule el Gradiente y el Costo ============
%  En esta parte del ejercicio, usted implementará el costo y gradiente
%  de regresión logística. Necesita completar el código en la función
%  funcionDeCosto.m

%  Aliste apropiadamente la matriz de datos, y agregue unos para x0
[m, n] = size(X);

% Agregue unos a x y X_test
X = [ones(m, 1) X];

% Inicialice los parámetros
theta_inicial = zeros(n + 1, 1);

% Calcule y despliegue el costo y gradiente inicial
[costo, grad] = funcionDeCosto(theta_inicial, X, y);

fprintf('Costo en el theta inicial (ceros): %f\n', costo);
fprintf('Gradiente en el theta inicial (ceros): \n');
fprintf(' %f \n', grad);

fprintf('\nPrograma en pausa. Oprima enter para continuar.\n');
%pause;


%% ============= Parte 3: Optimizar utilizando fminunc  =============
%  En este ejercicio, usted va a utilizar una función ya proveida para
%  encontrar los parámetros óptimos theta. (fminunc)

%  Prepare las opciones para fminunc
opciones = optimset('GradObj', 'on', 'MaxIter', 400);

%  Corra fminunc para obtener el theta óptimo
%  Esta función devuelve el theta y el costo
[theta, cost] = ...
	fminunc(@(t)(funcionDeCosto(t, X, y)), theta_inicial, opciones);

% Inprima los datos en la pantalla 
fprintf('El costo de theta encontrado por fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

% Grafique la Frontera
grafiqueFrontera(theta, X, y);

% Ponga las etiquetas
hold on;
% Etiquetas
xlabel('Puntaje Examen 1')
ylabel('Puntaje Examen 2')

% Especificados en el orden de graficación
legend('Admitido', 'No admitido')
hold off;

fprintf('\nPrograma en pausa. Oprima enter para continuar.\n');
%pause;

%% ============== Parte 4: Predicción y Precisión ==============
%  Después de aprender los parámetros, le gustaría hacer predicciones
%  con datos que todavía ni ha visto. En esta parte utilizará el modelo
%  de regresión logística para predecir la probabilidad de que un estudiante
%  sea admitido con puntaje de 45 en el primer examen y 85 en el segundo.
%
%  Además, usted calculará la precisión del set de entrenamiento y del
%  set de pruebas (test) de su modelo.
%
%  Su tarea es completar el código en prediccion.m

%  Predecir la probabilidad de que un estudiante sea admitido con un 
%  puntaje de 45 en el primer examen y de 85 en el segundo

prob = sigmoide([1 45 85] * theta);
fprintf(['Para un estudiante con puntajes de 45 y 85, predecimos una ' ...
         'probabilidad de admisión de %f\n\n'], prob);

% Calcule la precisión en el set de entrenamiento
p = prediccion(theta, X);

fprintf('Precisión de Entrenamiento: %f\n', mean(double(p == y)) * 100);

fprintf('\nPrograma en pausa. Oprima enter para continuar.\n');
%pause;

