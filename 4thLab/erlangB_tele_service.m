clc;
clear all;
close all;
pkg load queueing;
% c : number of servers
% r = lambda / mu

%(1)
function p = erlangb_factorial (r,c)
  sum = 0;
  for k = 0:1:c
    sum = sum +(power(r,k)/factorial(k));
  endfor
  p = (power(r,c)/factorial(c))/sum;
endfunction

% Testcase


display("erlangb_factorial(5,5): ");
disp(erlangb_factorial(5,5));

display("erlangb(5,5): ")
disp(erlangb(5,5));


% (2)
function p = erlangb_iterative (r,c)
  p = 1;
  for i=0:1:c
    p = ((r*p)/((r*p)+i));
  endfor
endfunction


display("erlangb_iterative(5,5): ");
disp(erlangb_iterative(5,5));

display("erlangb(5,5): ")
disp(erlangb(5,5));


%(3)


display("erlangb_factorial(1024,1024): ");
disp(erlangb_factorial(1024,1024));

display("erlangb_iterative(1024,1024): ");
disp(erlangb_iterative(1024,1024));

%(4)

%(b)
P = zeros(200,1);
for k = 1:1:200

P(k)=  erlangb_iterative(k*(23/60),k)

endfor

figure(1);
bar(P,'r','hist');
xlim([0,200]);
title("Blocking probabilities for different numbers of lines");
xlabel("Number of service lines");
ylabel("Blocking probability");
