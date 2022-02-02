clear;
clc;
close all;

load('data.mat');
rho=0.01;
w_init1=[1,1,-0.5]';
w_init2=[1,1,0.5]';

figure(1)
scatter(classes(1,1:100),classes(2,1:100),'or')
hold on
scatter(classes(1,101:200),classes(2,101:200),'.')
grid minor
title('Binary Classification')
xlabel('attribute # 1')
ylabel('attribute # 2')


wfinal1=Perceptron(classes,class_labels,w_init1,rho);
wfinal2=Perceptron(classes,class_labels,w_init2,rho);
disp("Final Vector for w_init1 is :")
disp(wfinal1)
disp("Final Vector for w_init2 is :")
disp(wfinal2)

classes=classes';
line(classes(:,1), -wfinal1(1)/wfinal1(2)*classes(:,1) - wfinal1(3)/wfinal1(2),"Color","Red");
line(classes(:,1), -wfinal2(1)/wfinal2(2)*classes(:,1) - wfinal2(3)/wfinal2(2),"Color","Blue");

legend('Class A','Class B','final1-classification-boundary' ,'final2-classification-boundary')
