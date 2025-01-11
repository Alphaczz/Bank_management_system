package com.Utils;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionCookieUtil {

    // Set a session attribute
    public static void setSessionAttribute(HttpServletRequest request, String key, Object value) {
        HttpSession session = request.getSession();
        session.setAttribute(key, value);
    }

    // Get a session attribute
    public static Object getSessionAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession();
        return session.getAttribute(key);
    }

    // Remove a session attribute
    public static void removeSessionAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession();
        session.removeAttribute(key);
    }

    // Create a cookie
    public static void createCookie(HttpServletResponse response, String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge); // Expiry time in seconds (e.g., 24 hours)
        cookie.setHttpOnly(true);  // Makes the cookie inaccessible to JavaScript
        cookie.setSecure(true);    // Ensures cookie is sent over HTTPS only
        cookie.setPath("/");       // Scope of the cookie ("/" means it's available for the entire domain)
        response.addCookie(cookie);
    }

    // Get the value of a cookie by name
    public static String getCookieValue(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    // Remove a cookie by setting its max age to 0
    public static void removeCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, null);
        cookie.setMaxAge(0);  // Setting the max age to 0 will remove the cookie
        cookie.setPath("/");   // Ensure the same path as the original cookie
        response.addCookie(cookie);
    }

    // Clear all session attributes
    public static void clearSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate(); // Invalidates the current session
    }

    // Refresh session expiry time
    public static void refreshSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(30 * 60); // Set to 30 minutes (in seconds)
    }
}
