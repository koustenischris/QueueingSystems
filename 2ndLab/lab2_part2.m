% system M/M/1
clc;
clear all;
close all;

lambda = 5;
mu = 5.001:0.001:10; % The only possible values so the system be ergodic

[U, R, Q, X, p0] = qsmm1 (lambda, mu)
% Server Utilization
figure(1);
plot(mu,U,"r","linewidth",1.4);
title("Βαθμός χρησιμοποίησης (utilization) ως προς το ρυθμό εξυπηρέτησης");
xlabel("Ρυθμός εξυπηρέτησης μ πελάτες/min");
ylabel("Βαθμός χρησιμοποίησης ρ = λ/μ");

% Average server response time
figure(2);
plot(mu,R,"r","linewidth",1.4);
axis ([5 10 0 100]);
title("Μέσος χρόνος καθυστέρησης του συστήματος Ε(Τ) ως προς το ρυθμό εξυπηρέτησης");
xlabel("Ρυθμός εξυπηρέτησης μ");
ylabel("Μέοσς χρόνος απόκρισης(Ε(Τ))");

% Average number of request in the system
figure(3);
plot(mu,Q,"r","linewidth",1.4);
axis ([5 10 0 100]);
title("Μέσος αριθμός πελατών στο σύστημα ως προς το ρυθμό εξυπηρέτησης");
xlabel("Ρυθμός εξυπηρέτησης μ πελάτες/min");
ylabel("Μέσος αριθμός πελατών σε αναμονή");

% Throughtput of the system
figure(4);
plot(mu,X,"r","linewidth",1.4);
title("Ρυθμαπόδοση (throughput) πελατών ως προς το ρυθμό εξυπηρέτησης");
xlabel("Ρυθμός εξυπηρέτησης μ πελάτες/min");
ylabel("Ρυθμαπόδοση");

