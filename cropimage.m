% CROPIMAGE crops an image to specified dimensions from a 4-vector.
%
% Useage: img = cropimage(img, cropcoords)
%
% Arguments: img - the image to be cropped
%
%            cropcoords - a 4-vector of the form [r1 r2 c1 c2]
%
% Returns:   img - the cropped image
%
% If the image is to be cropped only from the top or left, and the width 
% or height of the image is unknown, r2 and/or c2 should be left as
% values less than or equal to r1 and c2 respectively.
% Produced by M. Horn & F. Williams @ QUT

function [img] = cropimage(img, cropcoords)

    c = cropcoords;

    if (c(2) <= c(1))
        img = img(c(1):end, :);
    else
        img = img(c(1):c(2), :);
    end

    if (c(4) <= c(3))
        img = img(:, c(3):end);
    else
        img = img(:, c(3):c(4));
    end

end