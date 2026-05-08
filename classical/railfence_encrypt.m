function cipherText = railfence_encrypt(plainText,key)
    plainText = lower(plainText(plainText ~= ' '));

    row = 1;
    dir = -1;
    for i=1:length(plainText)
        mat(row,i) = plainText(i);
        if row == key
            dir = -1;
        elseif row == 1
            dir = 1;
        end
        row = row + dir;
    end

    cipherText = '';
    for i=1:key
        for j=1:length(plainText)
            if mat(i,j) ~= 0
                cipherText = [cipherText mat(i,j)];
            end
        end
    end
    cipherText = upper(cipherText);
end
