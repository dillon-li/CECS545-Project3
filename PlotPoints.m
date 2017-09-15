function [] = PlotPoints( x, y, ~ )
% Plot points given a list of coordinates
% x contains all x coordinates
% y contains all y coordinates
% (Indices match)
% Tour is a 2 x N matrix with each column representing
% the x and y coordinates of one city.
% Also plots lines showing the shortest path

% Plot points
figure;
plot(x(1),y(1), '*'); % Start
hold on; % Keep starting point marker
plot(x(2:end),y(2:end),'o');
% plotTitle = ['TSP ' char(string(size(coords,2))) ' cities'];
% title(plotTitle);

% for i = 1:(size(tour,2))
%     xcoords = [coord1.x coord2.x];
%     ycoords = [coord1.y coord2.y];
%     line(xcoords, ycoords);
% end

% Save figure as a png
% filename = ['Deliverables/' plotTitle];
% print(filename, '-dpng');

end

