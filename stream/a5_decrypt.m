function cipher_txt=a5_decrypt(plain_txt,key)
new=[];
cipher_txt='';
if length(key) ~= 8
    error('Key must be exactly 8 characters');
end
%plain_txt
plain_ascii=double(plain_txt);
plain_bits=[];
for i=1:length(plain_ascii)
    b=dec2bin(plain_ascii(i),8)-'0';
    plain_bits=[plain_bits b];
end

%key  
key_ascii=double(key);  
key_bits=[];  
for i=1:length(key_ascii)  
    bk=dec2bin(key_ascii(i),8)-'0';  
    key_bits=[key_bits bk];  
end  

%split key into 3 registers  
x=key_bits(1:19);  
y=key_bits(20:41);  
z=key_bits(42:64);  
tx=0;  
ty=0;  
tz=0;  

%generate keystream for each bit  
for i=1:length(plain_bits)  
    mj= mode([x(9) y(11) z(11)]);  
    %clocking and shifting  
    if x(9)==mj  
        tx=xor(xor(x(14), x(17)), xor(x(18),x(19)));  
        x=[tx x(1:end-1)];  
    end  

    if y(11)==mj  
        ty=xor(y(21), y(22));  
        y=[ty y(1:end-1)];  
    end  

    if z(11)==mj  
        tz=xor(xor(z(8), z(21)), xor(z(22),z(23)));    
        z=[tz z(1:end-1)];  
    end  

    key_bits=xor(x(end),xor(y(end),z(end)));  
    %calc keystream  
    new=[new xor(key_bits,plain_bits(i))];  
end  

%convert cipher into chars

for i=1:8:length(new)
    cipher_txt=[cipher_txt  char(bin2dec(num2str(new(i:i+7))))];
end

end