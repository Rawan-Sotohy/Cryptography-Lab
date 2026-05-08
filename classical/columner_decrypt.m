function plain_txt=columner_decrypt(cipher_txt,key)
cipher_txt = lower(cipher_txt);
cipher_txt = cipher_txt(cipher_txt ~=' ');
key = lower(key);
key = key(key ~= ' ');
lenc = length(cipher_txt);
lenk = length(key);
rows = ceil(lenc/lenk);
[~,sortIndex] = sort(key);
idx=1;
for j=sortIndex
    for i=1:rows
        mat(i,j) = cipher_txt(idx);
        idx = idx+1;
    end
end
plain_txt = reshape(mat',1,[]);
end
