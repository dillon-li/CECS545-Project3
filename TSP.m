function [ fullDist, Edgelords ] = TSP( filename )
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

% Initialization: Use first city to create the first edge
currentTour = [1];
currentCity = 1;
closeCityDist = inf;
% Find closest city
for j = 1:size(unLoved,1)
    dist = Distance(x(currentCity), y(currentCity), x(unLoved(j)), y(unLoved(j)));
    if dist < closeCityDist
        closeCityDist = dist;
        closeCity = unLoved(j);
        iToLove = j;
    end
end
currentTour = [currentTour closeCity];
unLoved(j) = [];
EdgeLords = [currentCity; closeCity];
currentCity = closeCity; % Set current to next city for algorithm
    
% Loop until all cities are loved (added to the tour)
while size(unLoved,1) ~= 0
    closeCityDist = inf;
    pointToEdge = inf;
    
    % Find closest city
    for j = 1:size(unLoved,1)
        dist = Distance(x(currentCity), x(unLoved(j)), y(currentCity), y(unLoved(j)));
        if dist < closeCityDist
            closeCityDist = dist;
            closeCity = unLoved(j);
            iToLove = j;
        end
    end
    
    % Pick city to add to tour, and remove it from unLoved (make it loved)
    currentTour = [currentTour closeCity];
    unLoved(j) = [];
    
    % Make edgier
    edgier = [currentCity; closeCity];
    EdgeLords = [EdgeLords edgier];
    
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
end

end

