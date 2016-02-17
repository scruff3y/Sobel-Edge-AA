% Simple blur: average of colour values around each pixel.
% Really slow; need to rewrite using matrix ops.

function blurred = simpleBlur(image, blurSize)
    blurred = image;
    
    for chl = 1:size(image, 3);
        for col = blurSize+1:size(image, 2)-blurSize
            for row = blurSize+1:size(image, 1)-blurSize
                blurred(row, col, chl) = (sum(sum(image(row-blurSize:row+blurSize, col-blurSize:col+blurSize, chl)))) / (((blurSize*2) + 1)^2);
            end
        end
    end
end
