function [ weightedGraph ] = MakeGraph( edges, x, y, nodes)
% Function to create an undirected graph from a list of coordinates.
% Input is coordinates in the form read in from ReadFromSample

% Output is the directed graph and plot p
% - One weighted, one not weighted

for i = 1:size(edges,2)
    s(1,i) = edges(1,i);
    t(1,i) = edges(2,i);
end

for i = 1:size(s,2)
    weights(i,1) = Distance(x(s(i)), y(s(i)), x(t(i)), y(t(i)));
end

weightedGraph = digraph(s,t,weights,nodes);
% unweightedGraph = digraph(s,t,nodes);

end

