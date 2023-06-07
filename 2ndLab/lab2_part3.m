% system M/M/1/4
% when there are 3 clients in the system, the capability of the server doubles.

clc;
clear all;
close all;

lambda = 5;

lambda_i = [lambda lambda/2 lambda/3 lambda/4];

mu = 10;
states = [0, 1, 2, 3, 4]; % system with capacity 4 states
% the initial state of the system. The system is initially empty.
initial_state = [1, 0, 0, 0, 0];


% define the birth and death rates between the states of the system.
births_B = [lambda_i(1), lambda_i(2), lambda_i(3), lambda_i(4)];
deaths_D = [mu, mu, mu, mu];

% get the transition matrix of the birth-death process
transition_matrix = ctmcbd(births_B, deaths_D);
% get the ergodic probabilities of the system
P = ctmc(transition_matrix);

% plot the ergodic probabilities (bar for bar chart)
figure(1);
bar(states, P, "r", 0.5);
title("M/M/1/4 State Probability");
xlabel("Number of clients in the system");
ylabel("Ergodic Probability");

%(iii)
% mean number of clients in the system
mean_clients = 0;
for i = 1 : 1 : 5
  mean_clients = mean_clients + P(i)*(i-1);
endfor
display(mean_clients);

%(iv)
display("Blocking probability = ");
display(P(5));

%(v)
% transient probability of state 0 until convergence to ergodic probability. Convergence takes place P0 and P differ by 0.01
for j = 1:1:5
  index = 0;
  for T = 0 : 0.01 : 50
    index = index + 1;
    P0 = ctmc(transition_matrix, T, initial_state);
    Prob0(index) = P0(j);
    if P0 - P < 0.01
     break;
    endif
  endfor

  t = 0 : 0.01 : T;
  figure(j+1);
  plot(t, Prob0, "r", "linewidth", 1.3);
  xlabel("time(sec)");
  ylabel("Balance Probability");
endfor
