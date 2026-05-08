function [Cipher_txt,Cipher_txtd]=rc4_encrypt(Plain_txt,key)
lenp = length(Plain_txt);
lenk = length(key);
Cipher_txt = '';
Cipher_txtd =zeros(1,lenp);
S = zeros(1,256);
T = zeros(1,256);
for i=0:255
    S(i+1)=i;   
    T(i+1)=double(key(mod(i,lenk)+1));
end
j=0;
for i=0:255
    j= mod((j+S(i+1)+T(i+1)),256);
    temp = S(i+1);
    S(i+1)=S(j+1);
    S(j+1)=temp;
end
i=0;
j=0;
for l=1:lenp
    i = mod((i+1),256);
    j = mod((j+S(i+1)),256);
    temp = S(i+1);
    S(i+1)=S(j+1);
    S(j+1)=temp;    
    t = mod(S(i+1)+S(j+1),256);
    k = S(t+1);
    d = double(Plain_txt(l));
    x = bitxor(k,d);
    Cipher_txt(l)=char(x);
    Cipher_txtd(l)=x;
end

end