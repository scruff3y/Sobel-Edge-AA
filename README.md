# Sobel-Edge-AA

This is a set of MATLAB scripts that perform an edge-detect based anti-alias on an image. I made this just to play around with the concept of using a Sobel-type filter for edge-detection, and then using that output to blur the edges in an image.

How it works:
-

1. Reads in the source image.
2. Create a blurred copy of image.
3. Source image is converted to greyscale, and a Sobel-type filter is applied to find the edges, using one of the kernels in kernels.m.
4. Sobel output is multiplied by a 'strength' factor, normalised to range between 0 and 1, and then raised to the power of a 'weight' variable, so that only well-defined edges are left.
5. The filtered copy of the image is made from a combination of the source, and the blurred copy, using the Sobel output to determine how much of the source/blurred is in the final image.

Here are some examples of the output produced by these scripts:

Image 1: http://imgur.com/a/ezSOI

Image 2: http://imgur.com/a/p2SAG

Image 3: http://imgur.com/a/bXGzl

GIF of before and after: https://gfycat.com/AcclaimedGeneralDolphin

As per usual with edge-detect AA, text is *totally* screwed. This is WiP though, so it might be able to be fixed by tweaking.

Screenshots are from Unigine Valley benchmark: https://unigine.com/products/benchmarks/valley/

Footnotes:
---

Code is also in place to weight the edge blurring against the angle of the detected edge (the idea being that vertical and horizontal lines shouldn't need blurring). However, in testing it was found that the overall result was ineffective, so it is turned off in the final version of main.m.
