% Convolutes kernel over image.

function imageDelta = doKernel(kernel, image)
    imageRows = size(image, 1);
    imageCols = size(image, 2);
    kernelRows = size(kernel, 1);
    kernelCols = size(kernel, 2);

    overBuffer = zeros(imageRows + (2*kernelRows), imageCols + (2*kernelCols), size(image, 3));
    
    for row = 1:kernelCols
        for col = 1:kernelCols
            overBuffer(row:row+imageRows-1, col:col+imageCols-1, :) = overBuffer(row:row+imageRows-1, col:col+imageCols-1, :) + (kernel(row, col, :) .* image);
        end
    end
    
    imageDelta = overBuffer(kernelRows:kernelRows+imageRows-1, kernelCols:kernelCols+imageCols-1, :) ./ (kernelRows*kernelCols);
end
