<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LOGIN PAGE</title>
    <style>
        .login-container { width: 300px; margin: 100px auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }
        .form-group { margin-bottom: 15px; }
        .error { color: red; font-size: 0.9em; }
    </style>
</head>
<body>

    <div class="login-container">
        <h2 style="text-align:center">LOGIN</h2>
        
        <c:if test="${not empty errorMessage}">
            <p class="error">${errorMessage}</p>
        </c:if>

        <form action="MainController" method="Post">
            <div class="form-group">
                <label>User Name:</label><br>
                <input type="text" name="username" required style="width: 100%">
            </div>
            <div class="form-group">
                <label>Password:</label><br>
                <input type="password" name="password" required style="width: 100%">
            </div>
            <button type="submit" name="action" value="Login" style="width: 100%; padding: 8px;">Login</button>
        </form>
    </div>

</body>
</html>