function out = invcscan( in, num_rows, num_cols )
%Inverser C-Scan Summary of this function goes here
%   Detailed explanation goes here

tot_elem=length(in);

if nargin>3
	error('Too many input arguments');
elseif nargin<3
	error('Too few input arguments');
end

% Check if matrix dimensions correspond
if tot_elem~=num_rows*num_cols
	error('Matrix dimensions do not coincide');
end


% Initialise the output matrix
out=zeros(num_rows,num_cols);

cur_row=1;	cur_col=1;	cur_index=1;
    
    while cur_index <= tot_elem

        if mod(cur_row,2) ~= 0
            cur_col = 1;
            while cur_col <= num_cols
                out(cur_row, cur_col) = in(cur_index);
                cur_col = cur_col + 1;
                cur_index = cur_index + 1;
            end
            cur_row = cur_row + 1;
        else   
            cur_col = num_cols;
            while cur_col >= 1
                out(cur_row, cur_col) = in(cur_index);
                cur_col = cur_col - 1;
                cur_index = cur_index + 1;
            end
            cur_row = cur_row + 1;
        end
    end
end

