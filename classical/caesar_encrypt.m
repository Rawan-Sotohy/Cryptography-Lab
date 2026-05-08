function Cipher_txt=caesar_encrypt(Plain_txt,key)
Plain_txt = Plain_txt(Plain_txt ~=' ');
Plain_txt = lower(Plain_txt);
chars = 'a':'z';
len = length(Plain_txt);
for I=1:len
    idx = find(chars==Plain_txt(I)) - 1 +key;
    idx = mod(idx,26) + 1;
    Cipher_txt(I)=chars(idx);
end
end
 