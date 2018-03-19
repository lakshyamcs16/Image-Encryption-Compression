function out = convert2blocks_de_SScan( im, car )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

C = mat2cell(im, [256 256], [256 256]);
M = mat2cell(car, [256 256], [256 256]);
Block1 = cell2mat(C(1,1)); 
Block2 = cell2mat(C(1,2)); 
Block3 = cell2mat(C(2,1)); 
Block4 = cell2mat(C(2,2));

CarBlock1 = cell2mat(M(1,1));

Block1 = decryptBlock(Block1, CarBlock1);
Block2 = decryptBlock(Block2, CarBlock1);
Block3 = decryptBlock(Block3, CarBlock1);
Block4 = decryptBlock(Block4, CarBlock1);

HorzOne = horzcat(Block1, Block2);
HorzTwo = horzcat(Block3, Block4);
out = vertcat(HorzOne, HorzTwo);

end
