function cipher = playfair_encrypt(plain, key)

plain = lower(plain);
plain = plain(plain~=' ');
% plainlen = length(plain);

key = lower(key);
key = key(key~=' ');
keylen = length(key);

chars = 'a':'z';

key(key == 'j') ='i';
chars(chars == 'j') ='i';

mat = [key chars];
mat = unique(mat, 'stable');
mat = reshape(mat, 5, 5)';

for i=1:2:length(plain)
    if plain(i) == plain(i+1)
        plain = [plain(1:i) 'x' plain(i+1:end)];
    end
end

if mod(length(plain),2) ~= 0
    if(plain(end) == 'x')
        plain = [plain 'z'];
    else
        plain = [plain 'x'];
    end
end

for i=1:2:length(plain)
    [r1,c1] = find(mat == plain(i));
    [r2,c2] = find(mat == plain(i+1));

    if r1==r2
        cipher(i) = mat(r1,mod(c1+1-1,5)+1);
        cipher(i+1) = mat(r2,mod(c2+1-1,5)+1);
    elseif c1==c2
        cipher(i) = mat(mod(r1+1-1,5)+1, c1);
        cipher(i+1) = mat(mod(r2+1-1,5)+1, c2);
    else
        cipher(i) = mat(r1,c2);
        cipher(i+1) = mat(r2,c1);
    end
end
cipher=upper(cipher);
end