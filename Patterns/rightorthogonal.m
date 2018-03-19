function encoded = rightorthogonal( img )

col = size(img,2);
encoded = zeros(1,length(img));
index = 1;
for i = 1 : col
    downindex = 1;
    while downindex <= i;
        encoded(index) = img(downindex, i);
        downindex = downindex + 1;
        index = index + 1;
    end
    
    leftindex = i - 1;
    while leftindex >= 1
        encoded(index) = img(downindex - 1, leftindex);
        leftindex = leftindex - 1;
        index = index + 1;
    end
end
end

