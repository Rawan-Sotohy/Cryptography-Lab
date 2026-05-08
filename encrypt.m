function output = encrypt(cipherType, text, key)

switch lower(cipherType)

    case 'caesar'
        output = caesar_encrypt(text, str2double(key));

    case 'vigenere'
        output = vigenere_encrypt(text, key);

    case 'playfair'
        output = playfair_encrypt(text, key);

    case 'affine'
        output = affine_encrypt(text, key);

    case 'hill'
        output = hill_encrypt(text, key);

    case 'railfence'
        output = railfence_encrypt(text, str2double(key));

    case 'columnar'
        output = columnar_encrypt(text, key);

    case 'double'
        output = double_encrypt(text, key);

    case 'rc4'
        output = rc4_encrypt(text, key);

    case 'a5_1'
        output = a5_encrypt(text, key);

    case 'rsa'
        output = rsa_encrypt(text, key);

    case 'otp'
        output = otp_encrypt(text, key);

    otherwise
        error('Unknown Cipher');

end

end