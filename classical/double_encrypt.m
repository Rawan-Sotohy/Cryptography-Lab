function Cipher_txt = double_encrypt(Plain_txt,Row_Per,Col_Per)
Chars = 'a':'z';
R = length(Row_Per); 
C = length(Col_Per); 
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt ~= ' ');
K=1;
for I = 1 : R
    for J = 1 : C
        if K <= length(Plain_txt)
            Mat(I,J) = Plain_txt(K);
        else
            Mat(I,J) = 'x';
        end
        K = K +1;
    end
end
disp(Mat);
for I = 1 : R
    Cipher_txt1(I,:) = Mat(Row_Per(I),:);
end 
  
for I = 1 : C
    Cipher_txt(:,I) = Cipher_txt1(:,Col_Per(I));
end 
Cipher_txt = reshape(Cipher_txt',[1,R*C]);
Cipher_txt = upper(Cipher_txt);
end