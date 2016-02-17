% init
clear all;
close all;

% loads kernels and other parameters.
kernels;

% Read in source image.
sourceImage = imread('./testimages/unnamed.jpg');

grayImage = rgb2gray(sourceImage);

grayImage = im2double(grayImage);

% Compute Sobel.
xAxisEdge = doKernel(Gx, grayImage);
yAxisEdge = doKernel(Gy, grayImage);
edgeImage = sqrt(xAxisEdge.^2 + yAxisEdge.^2);
sinEdgeImage = edgeImage .* sin(atan(abs(yAxisEdge)./(edgeImage+eps)));
sobelImage = dryWet(edgeImage, sinEdgeImage, angleMixer);

% Compute blur.
blurImage = simpleBlur(sourceImage, blurAmount);
blurImage = im2double(blurImage);

% Apply blur to edges.
sobel3D(:, :, 1) = sobelImage;
sobel3D(:, :, 2) = sobelImage;
sobel3D(:, :, 3) = sobelImage;
sobel3D = (sobelStrength.*sobel3D) ./ max(max(max(sobel3D))); % Normalise values.
doubleImage = im2double(sourceImage);
edgeBlurredImage = dryWet(doubleImage, blurImage, sobel3D);

% Writes all steps to file for comparison and debug.
imwrite(edgeImage, '1_edgeImage.png')
imwrite(sinEdgeImage, '2_sinEdgeImage.png')
imwrite(sobelImage, '3_sobelImage.png')
imwrite(blurImage, '4_blurImage.png')
imwrite(edgeBlurredImage, '5_edgeBlurredImage.png')
imwrite(doubleImage, '6_original.png')
