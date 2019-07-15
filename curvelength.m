% CURVELENGTH calculates the length of a curve specified by a vector of
% sequential (x,y) coordinate pairs.
%
% Arguments: coords - a vector of sequentially ordered (x,y) pairs
%                       describing a curve
%
% Returns:   edgelength - the length of the edge in pixel units
% Produced by M. Horn & F. Williams @ QUT

function edgelength = curvelength(coords)

    edgelength = 0;
    
    for j = 1:length(coords)-1

       dist = norm(coords(j+1,:) - coords(j, :));
       edgelength = edgelength + dist;
    end
        
end