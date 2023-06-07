% M/M/1/10 simulation. We will find the probabilities of the first states.
% Note: Due to ergodicity, every state has a probability >0.

clc;
clear all;
close all;

total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;

P = [0 0 0 0 0 0 0 0 0 0 0]; %Probabilities for each state
arrivals = [0 0 0 0 0 0 0 0 0 0 0]; % arrivals on each state
lambda = 1;
mu = 5;
rand("seed", 1);
threshold = lambda/(lambda + mu); % the threshold used to calculate probabilities

transitions = 0; % holds the transitions of the simulation in transitions steps

while transitions >= 0
  transitions = transitions + 1; % one more transitions step

  if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
    index = index + 1;
    for i=1:1:length(arrivals)
        P(i) = arrivals(i)/total_arrivals; % calcuate the probability of every state in the system
    endfor

    mean_clients = 0; % calculate the mean number of clients in the system
    for i=1:1:length(arrivals)
       mean_clients = mean_clients + (i-1).*P(i);
    endfor

    to_plot(index) = mean_clients;

    if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
      break;
    endif

    previous_mean_clients = mean_clients;

  endif

  random_number = rand(1); % generate a random number (Uniform distribution)
  if current_state == 0 || random_number < threshold % arrival
    if current_state <= 10
      total_arrivals = total_arrivals + 1;
      arrivals(current_state+1) = arrivals(current_state+1)+1 ;
      if current_state < 10
        current_state = current_state + 1; % if we are not at maximum capacity accept
      endif                                %the new client and increase current state
    endif
  else % departure
    if current_state != 0 % no departure from an empty system
      current_state = current_state - 1;
    endif
  endif
endwhile


display("Transistions needed for Convergence");
disp(transitions);

display("State probabilities:")
for i=1:1:length(arrivals)
  display(P(i));
endfor

P_blocking = P(11);
display("P{Blocking} = P{state = 10} = ");
disp(P_blocking);

display("The number of mean_clients when the simulation ends:");
disp(previous_mean_clients);

g = lambda*(1-P_blocking);
average_delay_time = mean_clients / g;
display("Average delay time =");
disp(average_delay_time);


figure(1);
plot(to_plot,"r","linewidth",1.3);
title("Average number of clients in the M/M/1/10 queue: Convergence with λ=1 clients/min");
xlabel("transitions in thousands");
ylabel("Average number of clients");

figure(2);
state = [0 1 2 3 4 5 6 7 8 9 10];
bar(state,P,'r',0.4);
title("Probabilities of each of the 11 states λ=1 clients/min");
