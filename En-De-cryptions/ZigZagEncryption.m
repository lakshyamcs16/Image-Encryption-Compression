clear;
warning('off', 'Images:initSize:adjustingMag');

tic;
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
 %lenna.jpg
 %albert.jpg
 %flowers.jpg
 %perm.gif
 %lady.gif
 %city.gif
 %monkey.png
 pw = input('Enter a password: ','s');
 pw = lower(pw);
 im = imread('city.gif');
 originalImage = im;
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
 
 imwrite(uint8(car), 'car.jpg');
 %im = double(im);
 
 im = convert2blocks_en(im, car);

  
oneDCar = reshape(car,1,[]);

for i = 1 : z
     A = im(:,:,i);
     A = zigzag(A);
     A = bitxor(A, oneDCar);
     A = invzigzag(A, x, y);
     im(:, :, i) = A;
end

%============================================================
 figure;
 im = uint8(im);
 encryptedImage = im;
 imshow(encryptedImage);
 %imwrite(encryptedImage, 'monkeyEncryptedImgZIG-ZAG.jpg');

 title('Encrypted Image');
 
 for i = 1 : z
     A = im(:, :, i);
     A = zigzag(A);
     A = bitxor(A, oneDCar);
     A = invzigzag(A, x, y);
     im(:, :, i) = A;
 end
 im = convert2blocks_de(im, car);
 
 figure;
 im = uint8(im);
 decryptedImage = im;
 imshow(decryptedImage);
 title('Decrypted Image');
  imwrite(decryptedImage, 'monkeyDecryptedImgZIG-ZAG.jpg');

 thePSNR = psnr(originalImage, encryptedImage);
theIMSE = immse(originalImage, encryptedImage);

%K = imabsdiff(originalImage, decryptedImage);
%figure;
%imshow(K, []);
en      = entropy(originalImage);
entrEncrypt = entropy(encryptedImage);
entrDecrypt = entropy(decryptedImage);

%imhist(originalImage);
imhist(encryptedImage);
%imhist(decryptedImage);
fprintf('PSNR Value %f: \n',thePSNR);
fprintf('MSE Value %f: \n',theIMSE);
fprintf('Entropy of Original Image %f: \n',en);
fprintf('Entropy of Encrypted Image %f: \n',entrEncrypt);
fprintf('Entropy of Decrypted Image %f: \n',entrDecrypt);

toc;