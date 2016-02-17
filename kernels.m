% Definition of kernels in x and y.
% For now, these will be simple 1  0 -1

% X-direction kernel (horizontal)
Gx = [
    -1,   0,  1;
    -1,   0,  1;
    -1,   0,  1
];

% Y-direction kernel (vertical)
Gy = [
     1,   1,  1;
     0,   0,  0;
    -1,  -1, -1
];

% Radius in pixels of simple blur applied to blurImage
blurAmount = 2;

% Dry/wet slider for reduced edge blurring when angle of edge is
% near-vertical or horizontal. Valid range is 0-1.
angleMixer = 1;

% Sets strength of sobel
sobelStrength = 2;
