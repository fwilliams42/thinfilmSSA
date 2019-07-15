% EDGEDETECT returns an edge-detected binary image
%
% Usage: [edgeimg, edgelist] = edgeDetectCanny(img, sens)
%
% Arguments:  img - grayscale image data obtained through imread
%
%             sens - gensitivity of Canny edge-detection in range (0, 1)
%
% Returns:    edgeimg - binary edge-detected image same size as img
%
%             edgelist - cell array containing the edge lists
%
% Additional parameters can be tuned for future consideration.
% Produced by M. Horn & F. Williams @ QUT

function [edgeimg, edgelist] = edgeDetect(img, sens)

    [cannyedge] = edge(img, 'Canny', sens); % Canny edge detection with sensitivity dictated by input.
    
    % Following line requires package from Peter Kovesi's library here: https://www.peterkovesi.com/matlabfns/#edgelink
    % Add the library to the Matlab path using the setpath UI or command.
    edgelist = edgelink(cannyedge); % Generate a list of supposedly connected points (edges) into a cell array.

    % Remove edges with less than 3 elements (aka noise).
    ind = cellfun(@(E) size(E, 1) < 3, edgelist); 
    edgelist(ind) = [];
    
    edgeimg = edgelist2image(edgelist, size(img)); % Generate an edge detected image from the edgelist.
    
end