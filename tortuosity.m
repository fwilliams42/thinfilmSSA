% TORTUOSITY calculates the tortuoisty of a curve specified by a vector of
% sequential (x,y) coordinate pairs.
%
% Arguments: coords - a vector of sequentially ordered (x,y) pairs
%                       describing a curve
%
% Returns:   tortuoisty - the tortuosity of the curve
% Produced by M. Horn & F. Williams @ QUT

function tortScale = tortuosity(coords)

    edgelength = curvelength(coords);
    
    tortScale = edgelength / norm(coords(end,:)- coords(1,:));

    if tortScale == inf
        tortScale = (edgelength / 2) / norm(coords(round((end)/2),:)- coords(1,:));
    end
    
end