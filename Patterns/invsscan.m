function out = invsscan( arr, m, n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

tot_elem=length(arr);

if nargin>3
	error('Too many input arguments');
elseif nargin<3
	error('Too few input arguments');
end

% Check if matrix dimensions correspond
if tot_elem~=m*n
	error('Matrix dimensions do not coincide');
end


% Initialise the output matrix
out=zeros(m,n);

k = 1;
l = 1;
     
     

     len = m*n;
     ind = 1;
     while (ind <= len)
     
         % Print the first row from the remaining rows
         for i = l : n
        	 out(k,i) = arr(ind) ;
             ind = ind + 1;
         end
         k = k + 1;
         % Print the last column from the remaining columns 
         for i = k : m
        	 out(i, n) = arr(ind);
        	 ind = ind + 1;
         end
         n = n - 1;

         % Print the last row from the remaining rows */
         if ( k <= m)
         
             for i = n: -1: l
             
            	 out(m, i) = arr(ind);
            	 ind = ind + 1;

             end
             m = m - 1;
         end

         % Print the first column from the remaining columns */
         if (l <= n)
         
             for i = m: -1: k
             
            	 out(i, l) = arr(ind);
            	 ind = ind + 1;

             end
             l = l + 1;    
         end

     end


end

