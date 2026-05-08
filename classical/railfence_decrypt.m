function plainText = railfence_decrypt(cipherText,key)
    cipherText = lower(cipherText(cipherText ~= ' '));

    row = 1;
    dir = 1;
    for j=1:length(cipherText)
        mat(row,j) = '-';
        if row == key
            dir = -1;
        elseif row == 1
             dir = 1;
        end
        row = row + dir;
    end
    
    idx = 1;
    for i=1:key
        for j=1:length(cipherText)
            if mat(i,j) == '-'
                mat(i,j) = cipherText(idx);
                idx = idx + 1;
            end
        end
    end
    
    plainText = '';
    row = 1;
    dir = 1;
    for j=1:length(cipherText)
        plainText = [plainText mat(row,j)];
        if row == key
            dir = -1;
        elseif row == 1
            dir = 1;
        end
        row = row + dir;
    end
    plainText = upper(plainText);
end