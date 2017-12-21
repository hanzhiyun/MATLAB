ax = worldmap('World');
setm(ax, 'Origin', [0 180 0]) 
land = shaperead('landareas', 'UseGeoCoords', true); 
geoshow(ax, land, 'FaceColor', [0.5 0.7 0.5]) 
lakes = shaperead('worldlakes', 'UseGeoCoords', true); 
geoshow(lakes, 'FaceColor', 'blue')
rivers = shaperead('worldrivers', 'UseGeoCoords', true); 
geoshow(rivers, 'Color', 'blue') 
% cities = shaperead('worldcities', 'UseGeoCoords', true) 
% geoshow(cities, 'Marker', '.', 'Color', 'red')
% data_cities = xlsread('cities.xlsx')