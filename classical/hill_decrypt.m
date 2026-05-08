function Plain_txt = hill_decrypt(Cipher_txt,Key)

Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt(Cipher_txt ~= ' ');
Key = lower(Key);
Key = Key(Key ~= ' ');
chars = 'a':'z';
Cipher_txt_len = length(Cipher_txt);
Plain_txt='';
Key_len = length(Key);
sqrt_len_key = sqrt(Key_len);

Det_inv = [1 3 5 7 9 11 15 17 19 21 23 25];
if(mod(sqrt_len_key,1)==0)
    
    for i = 1: Key_len
        KeyIndex(i) = find(chars == Key(i)) - 1;
    end
    
    for i=1: Cipher_txt_len
        Cipher_txt_to_index(i) = find(chars == Cipher_txt(i)) - 1;
    end
    
    key_Mat = reshape(KeyIndex,[sqrt_len_key sqrt_len_key])';
    det_key = int16(mod(det(key_Mat),26));
    for I=Det_inv
        if(mod(det_key*I,26) == 1)
            Det_inv = I;
            break;
        end
    end
    Adj_key = mod(det(key_Mat) * inv(key_Mat),26);
    key_Mat = mod(Det_inv*Adj_key,26);
    
    for i=1:sqrt_len_key:Cipher_txt_len
         Cipher_txt_index = Cipher_txt_to_index(i:i+sqrt_len_key-1);
         Cipher_txt_mat = reshape(Cipher_txt_index,[sqrt_len_key 1]);
    
         Plain_txt_index = int16(key_Mat * Cipher_txt_mat);
         Plain_txt_index = mod(Plain_txt_index,26)+1;
         Plain_txt = strcat(Plain_txt, chars(Plain_txt_index));
    end
else
    disp('Invalid Key');
end

end