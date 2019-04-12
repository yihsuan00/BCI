function [u]= findnan(x)
 [row, col] = find(isnan(x));
 row=sort(row);
 u=unique(row);
end



