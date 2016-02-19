% Definition of a variety of kernels for convolution over an image. Set Gx
% and Gy in main.m to one of these.

% Default Sobel operator kernels.
defaultSobelX = [
    -1,   0,  1;
    -2,   0,  2;
    -1,   0,  1
];

defaultSobelY = [
     1,   2,  1;
     0,   0,  0;
    -1,  -2, -1
];

% Inverted Sobel operator kernels.
invertedSobelX = [
    -1,   0,  1;
    -0.5,   0,  0.5;
    -1,   0,  1
];

invertedSobelY = [
     1,   0.5,  1;
     0,   0,  0;
    -1,  -0.5, -1
];

% Small isotropic kernels.
smallIsoX = [
    -1,   0,  1;
    -1,   0,  1;
    -1,   0,  1
];

smallIsoY = [
     1,   1,  1;
     0,   0,  0;
    -1,  -1, -1
];

% Centre kernel (best, in my experience so far).
centreKernel = [
    1,   1,   1;
    1,   -8,  1;
    1,   1,   1
];

% Large isotropic kernels.
largeIsoX = [
    0.5 1 0 -1 -0.5;
    0.5 1 0 -1 -0.5;
    0.5 1 0 -1 -0.5;
    0.5 1 0 -1 -0.5;
    0.5 1 0 -1 -0.5;
];

largeIsoY = [
    0.50, 0.50, 0.50, 0.50, 0.50;
    1.00, 1.00, 1.00, 1.00, 1.00;
    0.00, 0.00, 0.00, 0.00, 0.00;
    -1.0, -1.0, -1.0, -1.0, -1.0;
    -0.5, -0.5, -0.5, -0.5, -0.5;
];

% Adjacent kernels.
adjacentx = [
    0.00,   0.00,  0.00;
    -1.0,   0.00,  1.00;
    0.00,   0.00,  0.00
];

adjacenty = [
    0.00,   1.00,  0.00;
    0.00,   0.00,  0.00;
    0.00,   -1.0,  0.00
];