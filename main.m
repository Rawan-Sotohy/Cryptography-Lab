clc;
clear;

while true

    disp('===== Cryptography Lab =====');
    disp('1. Caesar Cipher');
    disp('2. Vigenere Cipher');
    disp('3. Playfair Cipher');
    disp('4. Affine Cipher');
    disp('5. Hill Cipher');
    disp('6. Rail Fence Cipher');
    disp('7. Columnar Cipher');
    disp('8. Double Transposition');
    disp('9. RC4');
    disp('10. A5/1');
    disp('11. RSA');
    disp('12. OTP');
    disp('0. Exit');

    choice = input('Choose Cipher: ');

    if choice == 0
        break;
    end

    mode = input('1. Encrypt\n2. Decrypt\nChoose Mode: ');

    text = input('Enter Text: ', 's');
    key = input('Enter Key: ', 's');

    cipherList = {
        'caesar', 'vigenere', 'playfair', 'affine',
        'hill', 'railfence', 'columnar', 'double',
        'rc4', 'a5_1', 'rsa', 'otp'
    };

    cipherType = cipherList{choice};

    if mode == 1
        result = encrypt(cipherType, text, key);
        disp(['Encrypted Text: ', result]);
    else
        result = decrypt(cipherType, text, key);
        disp(['Decrypted Text: ', result]);
    end

    disp(' ');
end
