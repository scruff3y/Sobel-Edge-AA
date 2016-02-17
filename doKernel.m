% Runs kernel over each pixel in the image.
% Edge pixels are not computed.

% 'kernel' must be 2D.
% NB: I suppose the kernel *could* be 3D, but I stuck with 2D for now to simplify.

function imageDelta = doKernel(kernel, image)
    imageDelta = image;
    
    numcols = (size(kernel, 2) - 1)/2;
    numrows = (size(kernel, 1) - 1)/2;
    
    for col = numcols+1:size(image, 2)-1;
        for row = numrows+1:size(image, 1)-1;
            multipliedValues = kernel .* image(row-1:row+1, col-1:col+1);
            imageDelta(row, col) = sum(sum(multipliedValues)) ./ (numrows*numcols);
        end
    end
end
