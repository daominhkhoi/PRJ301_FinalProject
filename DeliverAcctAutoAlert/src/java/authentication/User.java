package authentication;

import java.sql.Timestamp;

public class User {

    private int userId;
    private String username;
    private String passwordHash;
    private String fullName;
    private int roleId;
    private Timestamp createdAt;
    private String status;
    
    //Thuộc tính phụ
    private String roleName;

    public User() {
        
    }

    public User(String username, String passwordHash, String fullName, int roleId) {
        this.username = username;
        this.passwordHash = passwordHash;
        this.fullName = fullName;
        this.roleId = roleId;
    }

    public User(int userId, String username, String fullName, int roleId, String status, String roleName) {
        this.userId = userId;
        this.username = username;
        this.fullName = fullName;
        this.roleId = roleId;
        this.status = status;
        this.roleName = roleName;
    }

    public User(int userId, String username, String passwordHash, String fullName, int roleId, Timestamp createdAt, String status, String roleName) {
        this.userId = userId;
        this.username = username;
        this.passwordHash = passwordHash;
        this.fullName = fullName;
        this.roleId = roleId;
        this.createdAt = createdAt;
        this.status = status;
        this.roleName = roleName;
    }
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return passwordHash;
    }

    public void setPassword(String password) {
        this.passwordHash = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User [username=" + username + ", roleId=" + roleId + "]";
    }
}
