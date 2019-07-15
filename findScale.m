% FINDSCALE calculates the distance/pixel of an Zeiss SEM .tif image
%
% Usage: scale = findScale(imagePath)
%
% Arguments:  imagePath - Path to the .tif image, including the file name.
%                Eg. 'C:/Matlab/Images/example.tif'
%
% Returns:    scale - distance/pixel scale in m / pixel.
%
% Assumes a specific tag format used by the QUT Zeiss SEM.
% Produced by M. Horn & F. Williams @ QUT

function [scale] = findScale(imagePath)

    % Read in tags. AP_WIDTH is not a standardised tag.
    imgInfo = imfinfo(imagePath);
    imgTagInfo = imgInfo.UnknownTags.Value;

    % Find tag for aperature width.
    % Follows format: 'Width = 1.234 µm'
    EXPR1 = '\nWidth\s=\s\d+\.\d+\s\w*';
    AP_WIDTH_STRING = regexp(imgTagInfo, EXPR1, 'match');
    
    if (length(AP_WIDTH_STRING) > 1)
        error('Non-unique regex.')
    end
    
    % Obtain magnitude of number within string.
    EXPR2 = '\d+\.\d+';
    AP_WIDTH_NUMSTR = regexp(AP_WIDTH_STRING{1}, EXPR2, 'match');
    AP_WIDTH_NUM = str2double(AP_WIDTH_NUMSTR{1}); % Convert the text to useable number.

    % Adjust for units: µm, nm
    if (contains(AP_WIDTH_STRING{1}, 'µm'))
        AP_WIDTH_UNIT = 1e-6;
    elseif (contains(AP_WIDTH_STRING{1}, 'nm'))
        AP_WIDTH_UNIT = 1e-9;
    else
        error('Unknown unit.');
    end
    
    AP_WIDTH = AP_WIDTH_NUM * AP_WIDTH_UNIT;
    imgWidth = imgInfo.Width;
    
    scale = AP_WIDTH  / imgWidth; % Meters / pixel.

end