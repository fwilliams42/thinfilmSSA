% FINDSSA calculates the specific surface area of a layered graphitic
% material from .tif SEM images in a folder.
%
% Useage: [SSA, edgeimg, origimg] = findSSA(folderPath, density, cropcoords, scale, sens)
%
% Arguments: folderPath - the local path to the images folder
%
%            density - the average sample density
%
%            cropcoords - argument specifying the coordinates to
%                          crop the images (to remove information 
%                          ribbons from SEM, etc.) - enter 0 for no
%                          cropping
%               
%            scale - optional argument manually specifying the 
%                      distance/pixel scale (otherwise found automatically
%                      using .tif tag information)
%
%            sens - optional sensitivity argument vector containing values
%                     between (0, 1)
%
% Returns:   SSA - the specific surface area of the samples in m^2/g
%
%            edgeimg - the edge-detected images used for visually 
%                        determining the quality of the SSA estimate
%
%            origimg - cell array of original images for comparison
% Produced by M. Horn & F. Williams @ QUT

function [SSA, edgeimg, origimg] = findSSA(folderPath, density, cropcoords, scale, sens)

    if (nargin < 5)
        sens = linspace(0.275, 0.35, 4); % Default sensitivty values.
    end
    
    if (nargin < 3 || isscalar(cropcoords))
        cropcoords = [1, 1, 1, 1]; % If no cropping is specified, have no cropping.
    end
    
    images = dir(fullfile(folderPath, '*.tif')); % Gather .tif images in folder.
    SSA = zeros(length(images), length(sens)); % Pre-allocate a matrix to store values in.
    edgeimg = cell(length(images), length(sens)); % Pre-allocate cell.
    origimg = cell(length(images), 1); % Unedited images output
    
    for i = 1:length(images)
        imagePath = fullfile(folderPath, images(i).name); % Gather the file path to read in image.
        
        if (nargin < 4)
            scale = findScale(imagePath); % If scale not specified, find from image metadata.
        end
        
        [SSA(i, :), edgeimg(i, :), origimg{i}] = findSSAsingle(imagePath, density, cropcoords, scale, sens); % Extract the SSA and corresponding image.
        
    end

end