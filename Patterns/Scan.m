clear;
warning('off', 'Images:initSize:adjustingMag');

Pattern = [ '00110011';
            '00110101';
            '00110110';
            '00111001';
            '00111010';
            '00111100';
            '01010011';
            '01010101';
            '01010110';
            '01011001';
            '01011010';
            '01011100';
            '01100011';
            '01100101';
            '01100110';
            '01101001';
            '01101010';
            '01101100';
            '10010011';
            '10010101';
            '10010110';
            '10011001';
            '10011010';
            '10011100';
            '10100011';
            '10100101';
            '10100110';
            '10101001';
            '10101010';
            '10101100';
            '11000011';
            '11000101';
            '11000110';
            '11001001';
            '11001010';
            '11001100']
        
 Chars = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'];
 
 pw = input('Enter a password: ','s');
 pw = lower(pw);
 im = imread('original.jpg');
 imshow(im);
 title('Actual image');
 
 [x, y, z] = size(im);
 
 for i = 1 : length(pw)
     a = pw(i);
     a = find(Chars == a);
     a = Pattern(a,:);
     num(i) = bin2dec(a);
 end
 
 k = 1;
 for i = 1 : x
     for j = 1 : y
         car(i, j) = num(k);
         k = k + 1;
         if ( k > length(num) )
             k = 1;
         end
     end
 end
 figure;
 imshow(uint8(car));
 title('Career Image');
 
 im = double(im);
 
 for i = 1 : z
     im(:,:,i) = im(:,:,i)/10;
 end
 
  for i = 1 : z
     A = im(:,:,i);
     A = A + car;
     im(:, :, i) = A;
  end
 
 figure;
 imshow(uint8(im));
 title('Encrypted Image');
 
 for i = 1 : z
     A = im(:, :, i);
     A = A - car;
     im(:, :, i) = A*10;
 end
 figure;
 imshow(uint8(im));
 title('Decrypted Image');