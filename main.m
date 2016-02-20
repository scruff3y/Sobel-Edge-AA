% Main script for an edge-detection based Anti-Aliasing method, written in
% MATLAB. By; scruff3y, Feb 2016.

% Init workspace.
close all;
clear;

% Load kernels.
kernels;

% =========================================================================
% ============================= PARAMETERS ================================

% X-direction kernel (horizontal)
Gx = centreKernel;

% Y-direction kernel (vertical)
Gy = centreKernel;

% This parameter sets the amount of blur applied to the image before the
% sobel filter is run over it. The aim of this is to reduce the amount of
% noise. Range: int >= 0;
preprocessblur = 0;

% This parameter sets the amount of blur applied to the edges. Range: int
% >= 0
postprocessblur = 1;

% Brightens the blurred image to preserve highlights.
brighten = 1.22;

% Determines the percentage of sin weighting to be applied to sobel filter
% output. Range: 0 <= decimal <= 1.
angleMixer = 0;

% Sets weight of sine of edge angle. A higher value means that the angle of
% an edge must be further from the horizontal or vertical before a blur
% will be applied. Range: 1 <= decimal.
sinWeight = 1;

% Sets strength of sobel. Higher value -> greater percentage of blur added
% to edges. Range: 0 <= decimal.
edgeDetectStrength = 2.2;

% Sets weighting of sobel output.
edgeDetectWeight = 1.6;

% =========================================================================
% =========================================================================

% Read source image.
sourceImage = imread('./testimages/image3.png');

% Compute Post-process blur.
sourcePostBlurredImage = simpleBlur(brighten .* im2double(sourceImage), postprocessblur);

% Create greyscale version for sobel.
grayImage = simpleBlur(im2double(rgb2gray(sourceImage)), preprocessblur);

% Sobel filter, follwed by angle weighting.
xAxisEdge = doKernel(Gx, grayImage);
yAxisEdge = doKernel(Gy, grayImage);
combinedAxisEdge = sqrt(xAxisEdge.^2 + yAxisEdge.^2);
difference = (xAxisEdge-yAxisEdge)+eps;
sinAxisEdge = (1 - ((abs(difference)) ./ ((max(max(difference)))))) .^ sinWeight;
% sinAxisEdge = sin(2.*atan((yAxisEdge+eps) ./ (xAxisEdge+eps))) .^ sinWeight;
% This is because the more vertical or horizontal an edge is, the less
% blurring is needed. (does nothing for omni directional kernels).

% Mix combine and sin, then apply parameter weighting.
combined = dryWet(combinedAxisEdge, (combinedAxisEdge.*sinAxisEdge), angleMixer);
combined = ((edgeDetectStrength .* combined) ./ max(max(combined))) .^ edgeDetectWeight;

% Extrude combination to 3D
combined(:, :, 2) = combined;
combined(:, :, 3) = combined(:, :, 1);

% Apply edge blur using dry-wet mix of source and blur, with sobel filter
% to determine mix percentage.
edgeBlurredImage = dryWet(im2double(sourceImage), sourcePostBlurredImage, combined);

% Dump output and various stages of completion to file.
imwrite(combinedAxisEdge ./ max(max(combinedAxisEdge)), '1_raw filter output (normalised).png');
imwrite(sinAxisEdge, '2_angle filter.png');
imwrite(combined, '3_final filter output.png');
imwrite(sourceImage, '4_source.png');
imwrite(edgeBlurredImage, '5_edged.png');
