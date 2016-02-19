% Simple blur: average of colour values around each pixel. Does not do
% special cases for edges.

function blurred = simpleBlur(image, blurSize)
    if (blurSize == 0)
        blurred = image;
        return;
    end

    sizeRows = size(image, 1);
    sizeCols = size(image, 2);
    
    overBuffer = zeros(sizeRows+(blurSize*2), sizeCols+(blurSize*2), size(image, 3), 'like', image);
    
    for row = 1:blurSize+1
        for col = 1:blurSize+1
            overBuffer(row:row+sizeRows-1, col:col+sizeCols-1, :) = overBuffer(row:row+sizeRows-1, col:col+sizeCols-1, :) + image;
        end
    end
    
    overBuffer = overBuffer ./ ((blurSize+1)^2);
    
    blurred = overBuffer(blurSize:blurSize+sizeRows-1, blurSize:blurSize+sizeCols-1, :);
end