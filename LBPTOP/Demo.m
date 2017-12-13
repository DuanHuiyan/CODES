% clear
% close all
function [LBP_xoy,LBP_xot,LBP_yot] = Demo(data)
%----------randomly simulated 3-D video data------------%
% data = randi([0,255],128,128,30);   %%图像序列，3维矩阵

%----------Parameters------------%
% block size of (1x1x1), radius (R=1) and the number of neighbors (P=8)
R=1;
P=8;
patternMapping_u2 = getmapping(P,'u2');
nQr = 5;      %% 行分块              
nQc = 5;      %% 列分块
nQt = 1;      %%  时间轴分块
rolr = 0;
colr = 0;
tolr = 0;   
%----------Parameters------------%

tic
[LBP_xoy,LBP_xot,LBP_yot] = cal_cuboid_lbptop_vr(data, nQr, nQc, nQt, P, R, patternMapping_u2, rolr, colr, tolr);      
toc


