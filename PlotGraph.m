function [path, d1 ] = PlotGraph(g, x, y)
% Function to plot the graph along with the shortest path

figure;
if ismember('Weight', g.Edges.Properties.VariableNames)
    % Shortest path with distances taken into account
    p = plot(g, 'EdgeLabel', g.Edges.Weight, 'XData', x, 'YData', y);
    [path, d1] = shortestpath(g, 1, 11);
else
    % Shortest path without distances taken into account
    p = plot(g, 'Xdata', x, 'YData', y);
    [path, d1] = shortestpath(g, 1, 11);
end

% Displays shortest path in red
highlight(p, path, 'EdgeColor', 'r');




end

