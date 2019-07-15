% CALCSSA calculates the SSA from various assumptions of the material.
%
% Useage: SSA = calcSSA(edgeLengths, tort, nrows, ncols, scale, density)
% 
% Arguments:  edgeLengths - array of edge lengths
% 
%             tort - array of edge tortuosities
% 
%             nrows - number of rows in the image
%
%             ncols - number of columns in the image
%
%             scale - the ratio of distance (m) / pixel in the image
%
%             density - estimated density of sample (kg/m^3)
%
% Returns:    SSA - vector of estimated specific surface areas in (m^2/g)
%
% Assumptions of rotational invariance about the vertical axis, and
% non-holy material.
% Produced by M. Horn & F. Williams @ QUT

function [SSA] = calcSSA(edgeLengths, tort, nrows, ncols, scale, density)
    
    % Area by depth method.
    area = 2 * sum(edgeLengths .* tort) * scale^2;
    
    height = nrows * scale;
    width = ncols * scale;
    
    volume = width * height * scale;
    mass = volume * density;  

    SSA = area / mass * 1e-3; % m^2 / g
end