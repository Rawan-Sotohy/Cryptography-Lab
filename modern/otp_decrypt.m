function plainText = otp_decrypt(cipherText,key)
    cipherText = lower(cipherText(cipherText ~= ' '));
    key = lower(key(key ~= ' '));

    new_key = '';
    for i=1:length(cipherText)
        idx = mod(i,length(key));
        if idx == 0
            idx = length(key);
        end
        new_key(i) = key(idx);
    end
    
    for i=1:length(cipherText)
        new_ch = mod(cipherText(i) - 'a' - (new_key(i) - 'a'),26);
        new_ch = char(new_ch + 'a');
        plainText(i) = new_ch;
    end
    plainText = upper(plainText);
end
