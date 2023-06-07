clc;
clear all;
close all;

# Exponential distribution

# Task A
m = [0.5 1 3];
lambda = 1./m;
k = 0:0.00001:8;

for i = 1 : columns(m)
  exponential_pdf(i,:) = exppdf(k,m(i));
endfor

figure(1);
hold on;
colors = 'rbkm';
for i = 1 : columns(m)
  plot(k,exponential_pdf(i,:),colors(i));
endfor
hold off;
title("Probability Density Function of Exponential processes");
xlabel("k values");
ylabel("probability");
legend("mean=0.5", "mean=1","mean=3");

# Task B
m = [0.5 1 3];
lambda = 1./m;
k = 0:0.00001:8;
for i = 1 : columns(lambda)
  exponential_cdf(i,:) = expcdf(k,lambda(i));
endfor

figure(2);
hold on;
colors = 'rbkm';
for i = 1 : columns(lambda)
  plot(k,exponential_cdf(i,:),colors(i));
endfor
hold off;
title("Cumulative Distribution Function of Exponential processes");
xlabel("k values");
ylabel("probability");
legend("mean=0.5", "mean=1","mean=3");

# Task C
k = 0:0.00001:8;
lambda = 2.5;
exponential_cdf_ = expcdf(k,lambda);

display("The P[X > 30000] = ");
display(1-exponential_cdf_(30000));

answer = (1-exponential_cdf_(50000))/(1-exponential_cdf_(20000));
display("P[X > 50000 | X > 20000] = ");
display(answer);
