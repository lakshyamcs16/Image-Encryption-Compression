function encoded = ZetaZ( img )

[row,col]= size(img);
index = 1;
encoded = zeros(1,length(img));
for i = 1: 2: row - 1
    for j = 1: 2: col - 1
        downIndex = j;
        startingIndex = i;
        counter = 0;
        while counter ~= 4

            if counter == 2
                downIndex = j;
                startingIndex = startingIndex + 1;
            end
            encoded(index) = img(startingIndex, downIndex);
            downIndex = downIndex + 1;
            index = index + 1;
            counter = counter + 1;
        end
    end
end
    

end

