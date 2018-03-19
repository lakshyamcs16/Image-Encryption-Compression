function out = sscan( a )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


k = 1;
l = 1;

[m, n]=size(a);

     ind = 1;
     out=zeros(1,m*n);  
     while k <= m && l <= n
         % Print the first row from the remaining rows
         for i = l : n
             out(ind) = a(k, i);
             ind = ind + 1;
         end
         k = k + 1;

         % Print the last column from the remaining columns 
         for i = k : m
        
        	 out(ind) =a(i, n);
        	 ind = ind + 1;
         end
         n = n - 1;

         % Print the last row from the remaining rows */
         if ( k <= m)
         
             for i = n : -1 : l
            	 out(ind) =a(m, i);
            	 ind = ind + 1;
             end
             m = m - 1;
         end

         % Print the first column from the remaining columns */
         if (l <= n)
         
             for i = m: -1 : k
             
            	 out(ind) =a(i, l);
            	 ind = ind + 1;
             end
             l = l + 1;    
         end       
     end
end

