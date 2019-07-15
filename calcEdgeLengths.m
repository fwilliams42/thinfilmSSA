% CALCEDGELENGTHS calculates the lengths and tortuosities of edges in a
% supplied edgelist.
% 
% Useage: [edgeLengths, tortScale] = calcEdgeLengths(edgelist)
% 
% Arguments:  edgelist - list of edges generated by edgeDetectCanny
%
% Returns:    edgeLengths - the length of the edge in pixel units
%
%             tortScale - the tortuosity of the edge
% Produced by M. Horn & F. Williams @ QUT

function [edgeLengths, tortScale] = calcEdgeLengths(edgelist)
    
    edgeLengths = cellfun(@curvelength, edgelist); % Calculates the length of the edges.
    tortScale = cellfun(@tortuosity, edgelist); % Calculates the tortuosity of the edges.

end