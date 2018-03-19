function encoded = XiX( img )

N = 4*ones(1,128); %divides 512-by-512 image into 128 cells of 4-by-4 matrices.
B = mat2cell(img,N,N); 

[row, col] = size(B);
encoded = zeros(1, row*col);
index = 1;
for i = 1 : row
    for j = 1 : col
        subImg = B{i,j};
        subImg = mat2cell(subImg, [2 2], [2 2]);
        encodedBlock = Xi2by2Cell(subImg);
        encoded(index:index+15) = encodedBlock;
        index = index + 16;
    end
end

end

function Xi1D = Xi2by2Cell(partOfImg)
[row, col] = size(partOfImg);
Xi1D = zeros(1,16);
partOfImg = Xi2by2Mat(partOfImg);
partOfImg = reshape(partOfImg, 2, 2);
index = 1;
for i = 1 : 2
    for j = 1 : 2
        
        Xi1D(index:index+3) = Xi2by2Mat(partOfImg{i,j});
        index = index + 4;
    end
end

    function smallest1DBlock = Xi2by2Mat(smallestBlock)
        smallest1DBlock = [smallestBlock(1,1) smallestBlock(2,2) smallestBlock(1,2) smallestBlock(2,1)];
    end
end

