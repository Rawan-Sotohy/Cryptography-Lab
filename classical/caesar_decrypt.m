function Plain_txt = caesar_decrypt(Cipher_txt,Key)
Cipher_txt = lower(Cipher_txt);
chars = 'a':'z';
Cipher_txt_len = length(Cipher_txt);
for i = 1 :Cipher_txt_len
    index = (find(chars == Cipher_txt(i)) -1 -Key) ;
    index = mod(index,26) + 1;
    Plain_txt(i) = chars(index);
    
end
end
