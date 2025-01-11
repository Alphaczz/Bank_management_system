package com.Utils;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.KeySpec;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.util.Base64;

public class PasswordUtil {

    private static final String ALGORITHM = "PBKDF2WithHmacSHA256";  // Secure hash algorithm
    private static final int ITERATIONS = 10000;  // Number of iterations for PBKDF2
    private static final int KEY_LENGTH = 256;    // Length of the generated key (in bits)

    // Hash password using PBKDF2 with salt
    public static String hashPassword(String password) {
        // Generate a random salt
        byte[] salt = generateSalt();

        // Create the hash using PBKDF2 algorithm
        String hashedPassword = null;
        try {
            hashedPassword = hashPasswordWithSalt(password, salt);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        // Return the base64 encoded salt + hashed password
        return Base64.getEncoder().encodeToString(salt) + ":" + hashedPassword;
    }

    // Verify if the entered password matches the stored hash
    public static boolean verifyPassword(String enteredPassword, String storedPassword) throws NoSuchAlgorithmException {
        // Split the stored password into salt and hash
        String[] parts = storedPassword.split(":");
        byte[] salt = Base64.getDecoder().decode(parts[0]);
        String storedHash = parts[1];

        // Hash the entered password with the same salt
        String enteredHash = hashPasswordWithSalt(enteredPassword, salt);

        // Compare the entered hash with the stored hash
        return storedHash.equals(enteredHash);
    }

    // Hash the password with the given salt using PBKDF2
    private static String hashPasswordWithSalt(String password, byte[] salt) throws NoSuchAlgorithmException {
        // Use PBKDF2 with HmacSHA256
        KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, ITERATIONS, KEY_LENGTH);
        SecretKeyFactory factory = null;
        try {
            factory = SecretKeyFactory.getInstance(ALGORITHM);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            throw new NoSuchAlgorithmException("PBKDF2WithHmacSHA256 not available.");
        }

        byte[] hashedBytes = null;
        try {
            hashedBytes = factory.generateSecret(spec).getEncoded();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Convert the hashed bytes into a hex string
        return bytesToHex(hashedBytes);
    }

    // Generate a secure random salt
    private static byte[] generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16]; // 16 bytes salt for better security
        random.nextBytes(salt);
        return salt;
    }

    // Convert byte array to hex string
    private static String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            hexString.append(String.format("%02x", b));
        }
        return hexString.toString();
    }
}
