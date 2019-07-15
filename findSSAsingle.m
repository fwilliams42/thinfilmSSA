% FINDSSASINGLE calculates the specific surface area of a layered graphitic
% material from a single .tif SEM image.
%
% Useage: [SSA, edgeimg, origimg] = findSSAsingle(imagePath, density, cropcoords, scale, sens)
%
% Arguments: imagePath - the local path to the image
%
%            density - the average sample density
%
%            cropcoords - the coordinates to crop the images (to remove
%                           information ribbons from SEM, etc.) - input
%                           ones(1,4) for no cropping.
%                          
%            scale - the distance/pixel scale
%
%            sens - sensitivity argument vector containing values
%                     between (0, 1)
%
% Returns:   SSA - the specific surface area of the sample in m^2/g
%
%            edgeimg - the edge-detected images used for visually 
%                        determining the quality of the SSA estimate 
%
%            img - the original image array including cropping
% Produced by M. Horn & F. Williams @ QUT

function [SSA, edgeimg, img] = findSSAsingle(imagePath, density, cropcoords, scale, sens)

    img = imread(imagePath);

    if ndims(img) == 3
        img = rgb2gray(img);
    end
    
    img = cropimage(img, cropcoords);

    [nrows, ncols] = size(img);

    SSA = zeros(1, length(sens));
    edgelist = cell(1,length(sens));
    edgeimg = cell(1,length(sens));
    edgeLengths = cell(1,length(sens));
    tortScale = cell(1,length(sens));

    for i = 1:length(sens)

        [edgeimg{i}, edgelist{i}] = edgeDetect(img, sens(i)); % Edge detection with Canny edge detector. See function for info.

        [edgeLengths{i}, tortScale{i}] = calcEdgeLengths(edgelist{i}); % See function for info.

        SSA(i) = calcSSA(edgeLengths{i}, tortScale{i}, nrows, ncols, scale, density); % Final SSA. 

    end

end