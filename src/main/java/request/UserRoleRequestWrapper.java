package request;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class UserRoleRequestWrapper extends HttpServletRequestWrapper {
	 
    private String user;
    private String role = null;
    private HttpServletRequest realRequest;
 
    public UserRoleRequestWrapper(String user, String role, HttpServletRequest request) {
        super(request);
        this.user = user;
        this.setRole(role);
        this.realRequest = request;
    }
 
    @Override
    public boolean isUserInRole(String role) {
        if (role == null) {
            return this.realRequest.isUserInRole(role);
        }
        return role.contains(role);
    }
 
    @Override
    public Principal getUserPrincipal() {
        if (this.user == null) {
            return realRequest.getUserPrincipal();
        }
 
        // Make an anonymous implementation to just return our user
        return new Principal() {
            public String getName() {
                return user;
            }
        };
    }

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
