function cipherText = otp_encrypt(plainText,key)
    plainText = lower(plainText(plainText ~= ' '));
    key = lower(key(key ~= ' '));

    new_key = '';
    for i=1:length(plainText)
        idx = mod(i,length(key));
        if idx == 0
            idx = length(key);
        end
        new_key(i) = key(idx);
    end
    
    for i=1:length(plainText)
        new_ch = mod(plainText(i) - 'a' + (new_key(i) - 'a'),26);
        new_ch = char(new_ch + 'a');
        cipherText(i) = new_ch;
    end
    cipherText = upper(cipherText);
end