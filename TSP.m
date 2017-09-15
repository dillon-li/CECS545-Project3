function [ distMin, weightedPath, unweightedPath, visualizeParams ] = TSP( filename )
% Main Traveling Salesman Problem
% Project 2 Style: Find the shortest path in a hardcoded directed graph.

% Input: Filename

% Output:
% distMin - The minimum distance required to travel for a weighted graph
% weightedPath - The minimum path for a weighted graph (distances included)
% unweightedPath - The path assuming all node distances the same
% visualizeParams - Paramters for 'visualize_search' to visualize different
% searchs. Cell array. Details below:
    % BFS_T - Table of traversal for breath first search
    % DFS_T - Table of traversal for depth first search
    % g - Directed graph of cities
    % x - X coordinates
    % y - Y coordinates

% Read in Coordinates
coords = ReadFromSample(filename);

% Make directed graph (weighted and unweighted)
[gW,g,x,y] = MakeGraph(coords);

% Perform Breadth first search and Depth first search
BFS_T = bfsearch(g,1,'allevents');
DFS_T = dfsearch(g,1,'allevents');

% Create parameters for search visualization
visualizeParams = [{g} {BFS_T} {DFS_T} {x} {y}];

% Plot the weighted graph with shortest path
[weightedPath, distMin] = PlotGraph(gW,x,y);

% Plot the unweighted graph with shortest path
[unweightedPath, ~] = PlotGraph(g,x,y);

end

