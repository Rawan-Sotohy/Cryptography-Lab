function Plain_txt=vigenere_decrypt(Cipher_txt,key)
Cipher_txt = lower(Cipher_txt);
key = lower(key);
chars = 'a':'z';
lenc = length(Cipher_txt);
for I=1:26
    Mat(I,:)=[chars(I:end) chars(1:I-1)];
end
for I=1:lenc
    idx1= find(chars==key(I));
    idx2= find(Mat(idx1,:)==Cipher_txt(I));
    Plain_txt(I)=chars(idx2);
end
end