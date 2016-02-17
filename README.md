# Sobel-Edge-AA

This is a MATLAB script which performs an edge-detect anti-alias on an image.

Two copies of the image are made; one that is blurred, and one that is greyscale.

The greyscale image is then passed through a Sobel filter to detect edges.

The original and blurred images are then mixed together, using the Sobel-filtered image as a weighting. Thus, pixels with a high value from the Sobel operation (which means they are on an edge) are blurred more than those with a low value.

The various parameters can be tweaked in kernels.m

Plans:
-

Modify simpleBlur to take a matrix *or* a number as the radius value. This should allow the blurring and mixing stages to completed in one pass, by blurring each pixel based on it's Sobel value and a parameter.

Modify doKernel to operate on the source, to avoid even more copying.

Modify doKernel and simpleBlur to properly effect edges, probably just by mirroring.
