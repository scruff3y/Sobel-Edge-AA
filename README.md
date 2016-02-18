# Sobel-Edge-AA

This is a MATLAB script which performs an edge-detect anti-alias on an image.

Two copies of the image are made; one that is blurred, and one that is greyscale.

The greyscale image is then passed through a Sobel filter to detect edges.

The original and blurred images are then mixed together, using the Sobel-filtered image as a weighting. Thus, pixels with a high value from the Sobel operation (which means they are on an edge) are blurred more than those with a low value.

The various parameters can be tweaked in kernels.m

Link to imgur album of b/a because I don't know how to use markdown lol: http://imgur.com/a/n3p3j

As per usual with edge-detect AA, text is totally screwed. This is WiP though, so it might be able to be fixed by tweaking.

Plans:
-

Modify doKernel and simpleBlur to properly effect edges, probably just by mirroring.
