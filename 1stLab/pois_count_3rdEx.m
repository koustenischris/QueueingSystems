clc;
clear all;
close all;

# Poisson Counting Process
# Task A
lambda = 5;
N = exprnd(1/lambda,1,100);
time = ones(100,1);
for i = 1:99
  N(i+1) = N(i+1)+N(i);
  time(i+1) = time(i+1)+time(i);
 endfor
figure(1);
stairs(N,time,color='b');
title("Poisson Counting Process with λ = 5 processes/sec");
ylabel("Events");
xlabel("seconds");

# Task B
# i)
lambda = 5;
event_num = 200; # the proposed number of events
N = exprnd(1/lambda,1,event_num);
time = ones(event_num,1);
for i = 1:(event_num-1)
  N(i+1) = N(i+1)+N(i);
  time(i+1) = time(i+1)+time(i);
endfor

figure(2);
stairs(N,time,color='b');
title(sprintf("Poisson Counting Process with λ = 5 processes/sec and %d processes",event_num));
ylabel("Events");
xlabel("Seconds");
display(sprintf("Approximation for %d events : %f",event_num,event_num/N(event_num)));
# ii)
lambda = 5;
event_num = 300; # the proposed number of events
N = exprnd(1/lambda,1,event_num);
time = ones(event_num,1);
for i = 1:(event_num-1)
  N(i+1) = N(i+1)+N(i);
  time(i+1) = time(i+1)+time(i);
endfor

figure(3);
stairs(N,time,color='b');
title(sprintf("Poisson Counting Process with λ = 5 processes/sec and %d processes",event_num));
ylabel("Events");
xlabel("Seconds");
display(sprintf("Approximation for %d events : %f",event_num,event_num/N(event_num)));
# iii)
lambda = 5;
event_num = 500; # the proposed number of events
N = exprnd(1/lambda,1,event_num);
time = ones(event_num,1);
for i = 1:(event_num-1)
  N(i+1) = N(i+1)+N(i);
  time(i+1) = time(i+1)+time(i);
endfor

figure(4);
stairs(N,time,color='b');
title(sprintf("Poisson Counting Process with λ = 5 processes/sec and %d processes",event_num));
ylabel("Events");
xlabel("Seconds");
display(sprintf("Approximation for %d events : %f",event_num,event_num/N(event_num)));
# iv)
lambda = 5;
event_num = 1000; # the proposed number of events
N = exprnd(1/lambda,1,event_num);
time = ones(event_num,1);
for i = 1:(event_num-1)
  N(i+1) = N(i+1)+N(i);
  time(i+1) = time(i+1)+time(i);
endfor

figure(5);
stairs(N,time,color='b');
title(sprintf("Poisson Counting Process with λ = 5 processes/sec and %d processes",event_num));
ylabel("Events");
xlabel("Seconds");
display(sprintf("Approximation for %d events : %f",event_num,event_num/N(event_num)));
# v)
lambda = 5;
event_num = 10000; # the proposed number of events
N = exprnd(1/lambda,1,event_num);
time = ones(event_num,1);
for i = 1:(event_num-1)
  N(i+1) = N(i+1)+N(i);
  time(i+1) = time(i+1)+time(i);
endfor

figure(6);
stairs(N,time,color='b');
title(sprintf("Poisson Counting Process with λ = 5 processes/sec and %d processes",event_num));
ylabel("Events");
xlabel("Seconds");
display(sprintf("Approximation for %d events : %f",event_num,event_num/N(event_num)));
