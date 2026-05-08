function Cipher_txt=vigenere_encrypt(Plain_txt,key)
Plain_txt = lower(Plain_txt);
key = lower(key);
chars = 'a':'z';
lenp = length(Plain_txt);
for I=1:26
    Mat(I,:)=[chars(I:end) chars(1:I-1)];
end
for I=1:lenp
    idx1 = find(chars==key(I));
    idx2 = find(chars==Plain_txt(I));
    Cipher_txt(I)=Mat(idx1,idx2);
end
end