package com.Utils;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Date;

public class JWTUtil {

    private static final String SECRET_KEY = "your_secret_key"; // Your secret key

    // Method to create JWT Token
    public static String generateToken(String email, String role) {
        try {
            // Header (Base64 encoded)
            String header = "{\"alg\":\"HS256\",\"typ\":\"JWT\"}";
            String encodedHeader = Base64.getEncoder().encodeToString(header.getBytes(StandardCharsets.UTF_8));

            // Payload (Base64 encoded)
            long currentTime = System.currentTimeMillis() / 1000; // Current timestamp in seconds
            String payload = String.format("{\"sub\":\"%s\",\"role\":\"%s\",\"iat\":%d,\"exp\":%d}", 
                                            email, role, currentTime, currentTime + 86400); // 86400 seconds = 24 hours
            String encodedPayload = Base64.getEncoder().encodeToString(payload.getBytes(StandardCharsets.UTF_8));

            // Signature (HMAC SHA256)
            String data = encodedHeader + "." + encodedPayload;
            Mac mac = Mac.getInstance("HmacSHA256");
            SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
            mac.init(secretKey);
            byte[] signature = mac.doFinal(data.getBytes(StandardCharsets.UTF_8));
            String encodedSignature = Base64.getEncoder().encodeToString(signature);

            // Final JWT Token
            return encodedHeader + "." + encodedPayload + "." + encodedSignature;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Method to validate the JWT Token (basic validation, not complete)
    public static boolean validateToken(String token) {
        try {
            String[] parts = token.split("\\.");
            if (parts.length != 3) return false;

            String header = new String(Base64.getDecoder().decode(parts[0]), StandardCharsets.UTF_8);
            String payload = new String(Base64.getDecoder().decode(parts[1]), StandardCharsets.UTF_8);
            String signature = parts[2];

            // Here you could add logic to verify the signature, check the expiration, etc.
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
