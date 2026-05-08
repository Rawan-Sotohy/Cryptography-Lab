function cipher_txt=rsa_decrypt(plain_txt,p,q)
n= p*q;
euler=(p-1)*(q-1);

e=2;
for i=2:euler-1
    if gcd(i,euler)==1
        e=i;
        break;
    end
end

d=1;
while mod((e*d), euler) ~= 1
    d=d+1;
end

disp(n);
disp(e);
disp(d);

for i=1:length(plain_txt)
    %cipher_txt(i)=mod(plain_txt(i)^e,n);
    cipher_txt(i)=mod(plain_txt(i)^d,n);
end
end