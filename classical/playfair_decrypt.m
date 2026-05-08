function plain = playfair_encrypt(cipher,key)

cipher = lower(cipher);
cipher = cipher(cipher ~=1);
cipherlen = length(cipher);

key = lower(key);
key = key(key ~=' ');
keylen = length(key);

chars = 'a':'z';
key(key == 'j')='i';
chars(chars == 'j')='i';

mat = [key chars];
mat = unique(mat, 'stable');
mat = reshape(mat, 5,5)';

for i=1:2:cipherlen
    [r1,c1] = find(mat == cipher(i));
    [r2,c2] = find(mat == cipher(i+1));

    if r1==r2
        plain(i) = mat(r1, mod(c1-1-1,5)+1);
        plain(i+1) = mat(r2, mod(c2-1-1,5)+1);
    elseif c1==c2
        plain(i) = mat(mod(r1-1-1,5)+1, c1);
        plain(i+1) = mat(mod(r2-1-1,5)+1, c2);
    else
        plain(i) = mat(r1,c2);
        plain(i+1) = mat(r2,c1);
    end
end
plain = upper(plain);
end