function [ weightedGraph, unweightedGraph, x, y ] = MakeGraph( coords )
% Function to create an undirected graph from a list of coordinates.
% Input is coordinates in the form read in from ReadFromSample

% Output is the directed graph and plot p
% - One weighted, one not weighted

% Create Node Table
for i = 1:size(coords,2)
    x(i) = coords(i).x;
    y(i) = coords(i).y;
end

% Hard coded city connections
s = [1 1 1 2 3 3 4 4 4 5 5 6 7 7 8 8 8 9 10];
t = [2 3 4 3 4 5 5 6 7 7 8 8 9 10 9 10 11 11 11];

for i = 1:size(s,2)
    weights(i,1) = Distance(x(s(i)), y(s(i)), x(t(i)), y(t(i)));
end

weightedGraph = digraph(s,t,weights);
unweightedGraph = digraph(s,t);

end

