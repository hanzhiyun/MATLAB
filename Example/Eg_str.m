%写一函数，输入一行字符，将此字符串中最长的单词输出
clc;clear;
ch = input('Please input a line of characters:','s');
n = length(ch);
k = 1;
a = 1;
%c={'';'';'';'';'';'';'';'';'';'';'';'';'';'';'';'';'';'';''};
c = cell(1,n);
for i = 1:n
    if i == n && ch(n) == ' '
        break;
    end
    if i == n && ch(n) ~= ' '
        c{1,k} = ch(1,a:i);
        
    end
    if ch(i) == ' '
        c{1,k}=ch(1,a:i-1);
        a=i+1;
        k=k+1;
    end
end

for j = 1:k
    y(j) = length(c{1,j});
end
[x,b] = max(y);
disp('the longest word is:');
disp(c{1,b});





