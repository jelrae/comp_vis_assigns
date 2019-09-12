% test your code by using this simple script

clear
clc
close all

I = imread('ball_albedo.png');
J = imread('ball_shading.png');
G = imread('ball.png');


J = iid_image_formation(I,J);
% J = recoloring(G);
