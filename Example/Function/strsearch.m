function [ cnt, pos ] = strsearch( s, c )
%STRSEARCH find the number of occurrences of a character in a string
%   Function STRSEARCH finds the number of occurrences of a character
%   c in a given string s. It returns both the index of the first
%   occurrence and the number of occurrences.
%   It returns 0 for both the index and the number of occurrences if
%   c does not exists in s.
%
%   By Pinar Senkul, 24/10/2003

pos = 0;
cnt = 0;

n = length(s);
for ii = n:-1:1,
    if ( s(ii) == c ),
        cnt = cnt + 1;
        pos = ii;
    end
end
