clc; clear; close all;

S = 328;
%%

for i = 1:1:328
    P(i,:) = [10, 1000, 10000, 10000, 10000, 1000];
    D(i,:) = [1, 1, 1, 1, 1, 1];
end

X_CTC = readmatrix('tmpdata0.txt');
q_CTC = readmatrix('tmpdata1.txt');
tmp = readmatrix('tmpdata2.txt');
NE_Tau = readmatrix('tmpdata3.txt');
torque_CTC = readmatrix('tmpdata4.txt');
Foot_Pos = readmatrix('tmpdata5.txt');
Foot_Pos_dot = readmatrix('tmpdata6.txt');
Q = readmatrix('tmpdata7.txt');
QDot = readmatrix('tmpdata8.txt');
Des_X = readmatrix('tmpdata9.txt');
out_torque = readmatrix('tmpdata12.txt');

X_CTC = X_CTC(1:S,:);
q_CTC = q_CTC(1:S,:);
tmp = tmp(1:S,:);
NE_Tau = NE_Tau(1:S,:);
torque_CTC = torque_CTC(1:S,:);
Foot_Pos = Foot_Pos(1:S,:);
Foot_Pos_dot = Foot_Pos_dot(1:S,:);
Q = Q(1:S,:);
QDot = QDot(1:S,:);
Des_X = Des_X(1:S,:);

error = Des_X(:,2:7) - Foot_Pos(:,2:7);
P_term = error.*P;
D_term = -Foot_Pos_dot(:,2:7).*D;

X_CTC_cal = P_term + D_term;

q_CTC_term = X_CTC_cal - tmp(:,2:7);
