function Cipher_txt = hill_encrypt(Plain_txt, Key)
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt ~= ' ');
Key = Key(Key ~= ' ');
Key = lower(Key);
Plain_txt_len = length(Plain_txt);
Key_len = length(Key);
chars = 'a':'z';
Cipher_txt = '';
sqrt_len_key = sqrt(Key_len);
DET = [1 3 5 7 9 11 15 17 19 21 23 25];
if(mod(sqrt_len_key,1)==0)

    for i = 1: Key_len
        KeyIndex(i) = find(chars == Key(i)) - 1;
    end
    for i=1: Plain_txt_len
        Plain_txt_to_index(i) = find(chars == Plain_txt(i)) - 1;
    end
    key_Mat = reshape(KeyIndex,[sqrt_len_key sqrt_len_key])';
    determinet_key = int16(mod(det(key_Mat),26));
    index = find(DET == determinet_key);
    if (~isempty(index))
        for i=1:sqrt_len_key:Plain_txt_len
            Plain_txt_index = Plain_txt_to_index(i:i+sqrt_len_key-1);
            Plain_txt_mat = reshape(Plain_txt_index,[sqrt_len_key 1]);

            Cipher_txt_index = mod(key_Mat * Plain_txt_mat,26) + 1;
            Cipher_txt = strcat(Cipher_txt, chars(Cipher_txt_index));
        end
        Cipher_txt = upper(Cipher_txt);
    else
        disp('Invalid Key');
    end

else
    disp('Invalid Key');
end
end
%to calculate determinet = int16(mod(det(Key),26))
%DET = [1 3 5 7 9 11 ]
%index = find(Det == Det_key)
%isempty(index); if not found
%Adj_key = int16 (det_key * inv(Key))
% Hello World, Hill ---> DRJIOGADXY
%what is plain_txt_to index is . vector or array or string 