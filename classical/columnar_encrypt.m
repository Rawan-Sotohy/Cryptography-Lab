function cipher_txt = columnar_encrypt(plain_txt,key)
plain_txt = lower(plain_txt);
key = lower(key);
plain_txt = plain_txt(plain_txt ~= ' ');
key = key(key ~= ' ');
lenp = length(plain_txt);
lenk = length(key);
rows = ceil(lenp/lenk);
idx=1;
for i=1:rows
    for j=1:lenk
        if idx<=lenp
            mat(i,j)=plain_txt(idx);
        else
            mat(i,j)='x';
        end
        idx = idx +1;
    end
end
[~,sortIndex] = sort(key);
cipher_txt = reshape(mat(:, sortIndex), 1, []);
end