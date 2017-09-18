function [ EdgeLords ] = TSP( filename )
% Main Traveling Salesman Problem
% Project 3 Style: Closest Edge Insertion Heuristic:

% Input: Filename

% Output:

% Read in Coordinates
[x,y] = ReadFromSample(filename);

% Array of cities not in the current tour (initially cities 2:end)
unLoved = zeros(size(x,2)-1,1);
for i = 1:size(unLoved,1)
    unLoved(i) = i+1;
end

% Initialization: Begin with a tour of 3 cities
currentTour = [1];
currentCity = 1;
dist = zeros(size(x,2)-1,1);
% closeCityDist = inf;
% Calculate distances for all cities from city 1
for j = 1:size(unLoved,1)
    dist(j) = Distance(x(currentCity), y(currentCity), x(unLoved(j)), y(unLoved(j)));
end
distCopy = dist;
dist = sort(dist);
city2 = find(distCopy==dist(1)); % Index closest to city 1
city3 = find(distCopy==dist(2)); % Index second closest to city 1
% Add these two cities to the tour - full beginning cycle
currentTour = [currentTour unLoved(city2) unLoved(city3) currentCity];
% Build starting edges
edge1 = [currentCity; unLoved(city2)];
edge2 = [unLoved(city2); unLoved(city3)];
edge3 = [unLoved(city3); currentCity];
EdgeLords = [edge1 edge2 edge3];
% Remove the cities (make loved)
city3 = city3 + 1;
unLoved(city2) = [];
indexToRemove = find(unLoved==city3);
unLoved(indexToRemove) = [];
    
% Loop until all cities are loved (added to the tour)
while size(unLoved,1) ~= 0
    pointToEdge = inf; % Distance from point to line segment
    
    % Pick arbitrary next city
    currentCity = unLoved(1);
    unLoved(1) = [];
    
    % Find the edgiest of current edges
    for k = 1:size(EdgeLords,2)
        cStart = EdgeLords(1,k); % Starting city of line segment
        cEnd = EdgeLords(2,k); % Ending city of line segment
        coordStart = [x(cStart) y(cStart) 0];
        coordEnd = [x(cEnd) y(cEnd) 0];
        coordCity = [x(closeCity) y(closeCity) 0];
        d = point_to_line(coordCity, coordStart, coordEnd);
        if d < pointToEdge
            pointToEdge = d; % Smallest distance from segment to new city
            edgiest = k; % Index of closest edge
        end
    end
    % Add the city in between the closest edge
    temp = EdgeLords(2,k); % Intermediate node
    EdgeLords(2,k) = currentCity; % Add first part of new edges
    newEdge2 = [currentCity; temp]; % Add second part of new edges
    EdgeLords = [EdgeLords newEdge2];
    
end

end

