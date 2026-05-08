function Plain_txt=affine_decrypt(Cipher_txt,a,b)
Plain_txt = '';
Cipher_txt = upper(Cipher_txt);
Cipher_txt = Cipher_txt(Cipher_txt ~=' ');
lenp = length(Cipher_txt);
chars = 'A':'Z';
for j=1:26
    if mod(a*j,26)==1
        x=j;
        break;
    end
end
for i=1:lenp
   idx = (x*((find(chars == Cipher_txt(i))-1)-b));
   idx = mod(idx,26)+1;
   Plain_txt(i) = chars(idx);
end

end
