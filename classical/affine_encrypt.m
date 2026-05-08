function Cipher_txt=affine_encrypt(Plain_txt,a,b)
Cipher_txt = '';
Plain_txt = upper(Plain_txt);
Plain_txt = Plain_txt(Plain_txt ~=' ');
lenp = length(Plain_txt);
chars = 'A':'Z';
if gcd(a,26)==1
    for i=1:lenp
        idx = ((find(chars == Plain_txt(i))-1)*a+b);
        idx = mod(idx,26)+1;
        Cipher_txt(i) = chars(idx);
    end
else
    error('Error: The value of "a" is not relatively prime to 26.');
end
end