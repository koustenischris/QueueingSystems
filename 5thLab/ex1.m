pkg load queueing

clc;
clear all;
close all;

a = 0.001:0.001:0.999;
lambda = 10000;

mu1 = 14650;
mu2 = 11720;

lambda1 = a.*lambda;
lambda2 = (1-a).*lambda;

[U1 R1 Q1 X1 P1] = qsmm1(lambda1,mu1);
[U2 R2 Q2 X2 P2] = qsmm1(lambda2,mu2);

R = a.*R1 + (1-a).*R2;

figure(1);
plot(a,R,'r',"linewidth",2);
title("Average response time of alternative routing system");
xlabel("Prob a");
ylabel("Average waiting time (sec)");
[minR,position] = min(R);
display("Minimun value of E(T)");
disp(minR);
display("For a =")
disp(0.001*(position+1));
