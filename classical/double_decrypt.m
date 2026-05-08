function Plain_txt = double_decrypt(Cipher_txt,Raw_Per,Col_Per)
R = length(Raw_Per);
C = length(Col_Per);
K=1;
for I=1:R
    for J=1:C
        Mat(I,J)=Cipher_txt(K);
        K=K+1;
    end
end
for J=1:C
    Plain_txt1(:,J) = Mat(:,find(Col_Per == J));
end
for I=1:R
    Plain_txt(I,:) = Plain_txt1(find(Raw_Per == I),:);
end

Plain_txt=reshape(Plain_txt',[1,R*C]);
end
