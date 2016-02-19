% Convolves kernel over image. Does not do special cases for edges.

function imageDelta = doKernel(kernel, image)
    imageRows = size(image, 1);
    imageCols = size(image, 2);
    kRows = size(kernel, 1);
    kCols = size(kernel, 2);
    kernelRows = (kRows - mod(kRows, 2)) / 2; % "radius" of kernel
    kernelCols = (kCols - mod(kCols, 2)) / 2; % ^

    overBuffer = zeros(imageRows + (2*kernelRows), imageCols + (2*kernelCols), size(image, 3));
    
    for row = 1:kRows
        for col = 1:kCols
            overBuffer(row:row+imageRows-1, col:col+imageCols-1, :) = overBuffer(row:row+imageRows-1, col:col+imageCols-1, :) + (kernel(row, col, :) .* image);
        end
    end
    
    imageDelta = overBuffer(kernelRows+1:kernelRows+imageRows, kernelCols+1:kernelCols+imageCols, :) ./ (kRows*kCols);
end