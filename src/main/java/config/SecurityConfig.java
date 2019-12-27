package config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SecurityConfig {

	public static final String ROLE_REGISTERED_USER = "REGISTERED";
    public static final String ROLE_GUEST_USER = "GUEST";
 
    // String: Role
    // List<String>: urlPatterns.
    private static final Map<String, List<String>> mapConfig = new HashMap<String, List<String>>();
 
    static {
        init();
    }
 
    private static void init() {
 
        // Configure For "GUEST" Role.
        List<String> urlPatterns1 = new ArrayList<String>();
        urlPatterns1.add("/userInfo");
        urlPatterns1.add("/mathGame");
        mapConfig.put(ROLE_GUEST_USER, urlPatterns1);
 
        // Configure For "REGISTERED" Role.
        List<String> urlPatterns2 = new ArrayList<String>();
        urlPatterns2.add("/userInfo");
        urlPatterns2.add("/gambleGame");
        urlPatterns2.add("/mathGame");
        mapConfig.put(ROLE_REGISTERED_USER, urlPatterns2);
    }
 
    public static Set<String> getAllAppRoles() {
        return mapConfig.keySet();
    }
 
    public static List<String> getUrlPatternsForRole(String role) {
        return mapConfig.get(role);
    }
 
}
