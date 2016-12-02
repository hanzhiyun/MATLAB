%写一函数，输入一行字符，将此字符串中最长的单词输出。
clear;clc;
str=input('please input a string:','s');
k=1;a=1;q=1;
%c={'';'';'';'';'';'';'';'';'';'';'';'';'';'';'';'';'';'';''};
n=length(str);
c=cell(1,n);
for i=1:1:n
    if i==n
           c{1,k}=str(1,a:i);
    end
    if str(i)==' '
        c{1,k}=str(1,a:i-1);
        a=i+1;
        k=k+1;
    end
end
for j=1:1:k
    y(j)=length(c{1,j});
end
  a=max(y);
  disp('the longest word is:');
  for p=1:1:k
    if y(p)==a;
    m(q)=p;
    q=q+1;
    end
  end
  for l=1:q-1
      v=m(l);
      disp(c{1,v});
  end
