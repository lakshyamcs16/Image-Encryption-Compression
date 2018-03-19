
function out = cscan( in )
%scan Summary of this function goes here
%   Detailed explanation goes here

[num_rows, num_cols]=size(in);

out=zeros(1,num_rows*num_cols);
cur_row=1;		cur_index=1;

while cur_row <= num_rows
    if mod(cur_row,2) ~= 0
        cur_col=1;
        while cur_col <= num_cols
            out(cur_index) = in(cur_row, cur_col);
            cur_col = cur_col + 1;
            cur_index = cur_index + 1;
        end
    else
        cur_col = num_cols;
        while cur_col >= 1
            out(cur_index) = in(cur_row, cur_col);
            cur_col = cur_col - 1;
            cur_index = cur_index + 1;
        end
    end
    cur_row = cur_row + 1;
end

