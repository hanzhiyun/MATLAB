%¼ÆËãË®ÏäÊ£ÓàÈİ»ı
r = input('Enter the radius of the tank base:');
h = input('Enter the height of the tank:');
water = input('Enter the amount of water:');
capacity = pi * r^2 * h;
space = capacity - water;
fprintf('There is %f m3 extra space in the tank\n', space);