# Sobel-Edge-AA

This is a set of MATLAB scripts that perform an edge-detect based anti-alias on an image. I made this just to play around with the concept of using a Sobel-type filter for edge-detection, and then using that output to blur the edges in an image.

How it works:
-

1. Reads in the source image.
2. Create a blurred copy of image.
3. Source image is converted to greyscale, and a Sobel-type filter is applied to find the edges, using one of the kernels in kernels.m.
4. Sobel output is multiplied by a 'strength' factor, normalised to range between 0 and 1, and then raised to the power of a 'weight' variable, so that only well-defined edges are left. Sobel output is also scaled against the *angle* of the edges detected in the image (this is to remove edges which run nearly parallel with the horizontal or vertical, since they do not need blurring).
5. The filtered copy of the image is made from a combination of the source, and the blurred copy, using the Sobel output to determine how much of the source/blurred is in the final image.

Link to imgur album of b/a because I don't know how to use markdown lol: http://imgur.com/a/n3p3j

As per usual with edge-detect AA, text is *totally* screwed. This is WiP though, so it might be able to be fixed by tweaking.
