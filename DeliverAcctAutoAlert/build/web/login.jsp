<%-- 
    Document   : login
    Created on : Jan 26, 2026, 2:34:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            /* 1. Căn giữa toàn bộ trang và đặt màu nền đồng bộ */
            body {
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f7f6; /* Nền xám nhẹ giống Dashboard */
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                color: #333;
            }

            /* 2. Thiết kế khung Login (Card) */
            .login-container {
                background: #fff;
                padding: 40px;
                border-radius: 8px; /* Bo góc 8px giống các bảng */
                box-shadow: 0 4px 15px rgba(0,0,0,0.05); /* Bóng mờ nhẹ nhàng */
                width: 100%;
                max-width: 350px;
                text-align: center;
            }

            /* Tiêu đề có gạch chân xanh */
            .login-container h1 {
                margin-top: 0;
                margin-bottom: 30px;
                color: #2c3e50; /* Màu chữ tối */
                font-size: 28px;
                border-bottom: 2px solid #3498db; /* Gạch chân xanh dương */
                padding-bottom: 10px;
                display: inline-block; /* Để gạch chân chỉ dài bằng chữ */
                width: 100%;
            }

            /* 3. Căn chỉnh các nhóm input */
            .input-group {
                margin-bottom: 20px;
                text-align: left;
            }

            .input-group label {
                display: block;
                margin-bottom: 8px;
                color: #555;
                font-weight: 600;
                font-size: 14px;
            }

            .input-group input {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
                outline: none;
                transition: border-color 0.3s;
                font-size: 14px;
            }

            /* Focus màu xanh dương */
            .input-group input:focus {
                border-color: #3498db; 
                box-shadow: 0 0 5px rgba(52, 152, 219, 0.2);
            }

            /* 4. Thiết kế nút bấm (Màu xanh chủ đạo) */
            .btn-login {
                width: 100%;
                padding: 12px;
                background: #3498db; /* Màu xanh dương giống nút Search */
                border: none;
                border-radius: 4px;
                color: white;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: background 0.3s, transform 0.2s;
                margin-top: 10px;
            }

            .btn-login:hover {
                background: #2980b9; /* Xanh đậm hơn khi hover */
                transform: translateY(-1px);
            }

            /* 5. Thông báo lỗi */
            h3 {
                font-size: 14px;
                margin-bottom: 15px;
                min-height: 18px; /* Giữ chỗ tránh giật layout */
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <form id="login-form" action="MainController" method="POST">
                <h1>Login</h1>
                
                <div class="input-group">
                    <label for="username">User Name</label>
                    <input type="text" id="username" name="username" required placeholder="Enter user name">
                </div>
                
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Enter password">
                </div>
                
                <%
                    String error = (String) request.getAttribute("error");
                    if (error == null) error = "";
                %>
                <h3 style="color: #c0392b;"><%=error%></h3> <button type="submit" class="btn-login" name="action" value="Login">Sign In</button>
            </form>
        </div>
    </body>
</html>