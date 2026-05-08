function output = decrypt(cipherType, text, key)

switch lower(cipherType)

    case 'caesar'
        output = caesar_decrypt(text, str2double(key));

    case 'vigenere'
        output = vigenere_decrypt(text, key);

    case 'playfair'
        output = playfair_decrypt(text, key);

    case 'affine'
        output = affine_decrypt(text, key);

    case 'hill'
        output = hill_decrypt(text, key);

    case 'railfence'
        output = railfence_decrypt(text, str2double(key));

    case 'columnar'
        output = columnar_decrypt(text, key);

    case 'double'
        output = double_decrypt(text, key);

    case 'rc4'
        output = rc4_decrypt(text, key);

    case 'a5_1'
        output = a5_decrypt(text, key);

    case 'rsa'
        output = rsa_decrypt(text, key);

    case 'otp'
        output = otp_decrypt(text, key);

    otherwise
        error('Unknown Cipher');

end

end