% TD Reconnaissance de Formes - Exercice 1
close all;
clear all;
clc;
% Compléter les informations manquantes (notées ...)
Max_x = 4;
Min_x = -4;
Pas = 0.01;
x = [Min_x:Pas:Max_x];
L = length(x);

% Considèrons que 2 classes sont modélisées par les densités de
% probabilité gaussiennes suivantes :
pxw1 = exp(-(x.*x))./sqrt(pi);
mu2 = 1;
sigma2 = sqrt(0.5); % ecart-type
pxw2 = exp(-(x-mu2).*(x-mu2)/(2*sigma2^2))./sqrt(2*pi*sigma2^2);

%% 1. 1er cas:  Pw1=Pw2=0,5
Pw1 = 0.5;
Pw2 = 1 - Pw1;

%  Tracés des densités de probabilités des 2 classes
figure(1)
hold on
plot(x,pxw1,'color','red')
plot(x,pxw2,'color','blue')
title('Densités de probabilités des classes (1:rouge, 2:bleue)')

%% Ajouter sur le même graphique les probabilités a posteriori
px = pxw1 * Pw1 + pxw2 * Pw2;
Pw1x = pxw1 * Pw1 ./ px;
Pw2x = pxw2 * Pw2 ./ px;
plot(x, Pw1x, 'color', 'green');
plot(x, Pw2x, 'color', 'black');
plot(x, px, 'color', 'magenta');
legend('p(x|w1)', 'p(x|w2)', 'P(w1|x)', 'P(w2|x)', 'p(x)');

% En déduire le seuil de classification optimale.
xb = 0.5;
indices = find(x <= xb);
M = length(indices);
Perreur = Pas * sum(pxw2(indices) .* Pw2);
Perreur = Perreur + Pas * sum(pxw1(indices(M) + 1:L) .* Pw1);


%% 2. Modification des valeurs de probabilité à priori
Pw1 = 9/10;
Pw2 = 1/10;

%  Tracés des densités de probabilités des 2 classes
figure(2)
hold on
plot(x,pxw1,'color','red')
plot(x,pxw2,'color','blue')
title('Densités de probabilités des classes (1:rouge, 2:jaune)')

%  Ajouter sur le même graphique les probabilités à posteriori
px = pxw1 * Pw1 + pxw2 * Pw2;
Pw1x = pxw1 * Pw1 ./ px;
Pw2x = pxw2 * Pw2 ./ px;
plot(x, Pw1x, 'color', 'green');
plot(x, Pw2x, 'color', 'black');
plot(x, px, 'color', 'magenta');
legend('p(x|w1)', 'p(x|w2)', 'P(w1|x)', 'P(w2|x)', 'p(x)');
    
% Que devient le seuil optimal ? Pourquoi ?
% parce que

% Prise en compte du numérateur uniquement
Pw1x = pxw1 * Pw1;
Pw2x = pxw2 * Pw2;

figure(3)
hold on
plot(x,pxw1,'color','red')
plot(x,pxw2,'color','blue')
title('Densités de probabilités des classes (1:rouge, 2:jaune)')
plot(x, Pw1x, 'color', 'green');
plot(x, Pw2x, 'color', 'black');
plot(x, px, 'color', 'magenta');
legend('p(x|w1)', 'p(x|w2)', 'P(w1|x)', 'P(w2|x)', 'p(x)');

% 
%Observations / commentaires : 
...

