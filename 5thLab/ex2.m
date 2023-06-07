clc;
clear all;
close all;
pkg load queueing


function [r1, r2, r3, r4, r5, e] = intesities(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5)
  r1 = (lambda1/mu1);
  r2 = ((lambda2+(2/7)*lambda1)/mu2);
  r3 = ((4/7)*lambda1/mu3);
  r4 = ((3/7)*lambda1/mu4);
  r5 = (((4/7)*lambda1+lambda2)/mu5);
  if((r1<1) && (r2<1) && (r3<1) && (r4<1) && (r5<1))
    erg = 1;
  else
    erg = 0;
  endif
  display("r1=")
  disp(r1)
  display("r2=")
  disp(r2)
  display("r3=")
  disp(r3)
  display("r4=")
  disp(r4)
  display("r5=")
  disp(r5)
  display("Ergodicity: ")
  disp(erg)
endfunction


function [r1, r2, r3, r4, r5, erg] = intesities_no_display(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5)
  r1 = (lambda1/mu1);
  r2 = ((lambda2+(2/7)*lambda1)/mu2);
  r3 = ((4/7)*lambda1/mu3);
  r4 = ((3/7)*lambda1/mu4);
  r5 = (((4/7)*lambda1+lambda2)/mu5);
  if((r1<1) && (r2<1) && (r3<1) && (r4<1) && (r5<1))
    erg = 1;
  else
    erg = 0;
  endif
endfunction

#3
function [Q1, Q2, Q3, Q4, Q5] = mean_clients(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5)
  [r1, r2, r3, r4, r5, erg] = intesities_no_display(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5);
  Q1 = r1/(1-r1);
  Q2 = r2/(1-r2);
  Q3 = r3/(1-r3);
  Q4 = r4/(1-r4);
  Q5 = r5/(1-r5);
endfunction

#4

lambda1 = 4;
lambda2 = 1;
mu1 = 6;
mu2 = 5;
mu3 = 8;
mu4 = 7;
mu5 = 6;
display("Intensities:");
[r1,r2,r3,r4,r5,erg]=intesities(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5);

display("mean_clients for each queue");
[Q1, Q2, Q3, Q4, Q5] = mean_clients(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5);
display("E(T)=")
disp((Q1+Q2+Q3+Q4+Q5)/(lambda1+lambda2))

#6

maxlambda1 = 6;
for i = 1:1:90;
  lambda1 = (0.1*maxlambda1)+(i-1)*0.01*maxlambda1;
  [Q1, Q2, Q3, Q4, Q5] = mean_clients(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5);
  E(i)= (Q1+Q2+Q3+Q4+Q5)/(lambda1+lambda2);
endfor

lambda1 = (0.1*maxlambda1):(0.01*maxlambda1):(0.99*maxlambda1);
figure(2);
plot(lambda1, E,"b","linewidth",2);
xlabel("lambda1");
ylabel("E(T)");
