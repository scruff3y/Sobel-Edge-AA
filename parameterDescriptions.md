#Parameters (defined in main.m)

    Gx, Gy
These are the kernels used in the horizontal and vertical directions, respectively.

    preprocessblur
This is the amount of blur applied to the image before edge-detection is run. This is typically used to remove noise from the output of the filter, however, I found that it worked better without any pre blurring, so I left this at 0. Range: int >= 0.

    postprocessblur
This is the amount of blur applied to the blurry copy of the image (see readme for more info). It is recommended to keep this fairly low, but it may depend on image/screen size. Range: int >= 1 (0 will work but do nothing).

    brighten
This brightens the blurred version of the image, to try and preserve some of the highlights that are muddied by the blurring of edges. Range: decimal >= 1.

    angleMixer
If using a non-omnidirectional kernel, the script will blur edges less if they are near the horizontal or vertical (this is because pixels are square (on screen), so blurring is not necessary). This parameter sets the amount of influence given by the angle of the edge. Note that if using an onmidirectional kernel, the output will darken if you use this setting. Range: 0 <= decimal <= 1. 

    sinWeight
A higher value here 'weights' the angle of the edge towards the higher end of the range. In other words, an edge close to horizontal or vertical will have exponentially less blur applied to it. Also only for non-omnidirectional kernels. Range: decimal >= 1.

    edgeDetectStrength
The strength of the detected edges scales linearly with this value.

    edgeDetectWeight
This weights the output of the edge detection by raising the normalised edge-detection values to the power of this value. Hence, a detected edge must be closer to 1 to show up properly.
