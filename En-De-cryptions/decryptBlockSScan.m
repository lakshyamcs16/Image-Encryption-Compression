function out = decryptBlockSScan( Block, CarrierBlock )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[x, y, z] = size(Block);
oneDCarBlock = reshape(CarrierBlock,1,[]);

for i = 1 : z
     A = Block(:,:,i);
     A = sscan(A);
     A = bitxor(A, oneDCarBlock);
     A = invsscan(A, x, y);
     Block(:, :, i) = A*10;
end

out = Block;
end

