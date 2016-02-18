% Runs over the image with the small kernel size, using standard sobel
% kernels of size 3.

close all;
clear;

% X-direction kernel (horizontal)
Gx = [
    -1,   0,  1;
    -2,   0,  2;
    -1,   0,  1
];

% Y-direction kernel (vertical)
Gy = [
     1,   2,  1;
     0,   0,  0;
    -1,  -2, -1
];

sourceEdgeBlur = 1;
mixBlur = 3;

% Sets strength of sobel output. Grows with 'n'.
edgeDetectStrength = 2;

% Sets weight of sobel output. Grows with '^n'
edgeDetectWeight = 3;

% -------------------------------------------------------------------------

% Read source image.
sourceImage = imread('./testimages/image3.png');

% Create greyscale copy and convert to double.
grayImage = rgb2gray(sourceImage);
grayImage = im2double(grayImage);

% Simple blur to reduce noise.
grayImage = simpleBlur(grayImage, sourceEdgeBlur);

% Edge-detect.
xAxisEdge = doKernel(Gx, grayImage);
yAxisEdge = doKernel(Gy, grayImage);
combinedEdge = sqrt(xAxisEdge.^2 + yAxisEdge.^2);

% Extrude across all channels and apply strength/weighting.
combinedEdge(:, :, 2) = combinedEdge;
combinedEdge(:, :, 3) = combinedEdge(:, :, 1);
combinedEdge = ((edgeDetectStrength .* combinedEdge) ./ max(max(max(combinedEdge)))).^edgeDetectWeight;

% Create blurred copy.
blurImage = simpleBlur(im2double(sourceImage), mixBlur);

% Dry/wet mix of blurred and source, based on edge-detect
edgeBlurredImage = dryWet(im2double(sourceImage), blurImage, combinedEdge);

% Write to file.
imwrite(sourceImage, './smallKernelTestOutput/1_source.png');
imwrite(edgeBlurredImage, './smallKernelTestOutput/2_edgeBlurredImage.png');
imwrite(combinedEdge, './smallKernelTestOutput/3_edges.png');
