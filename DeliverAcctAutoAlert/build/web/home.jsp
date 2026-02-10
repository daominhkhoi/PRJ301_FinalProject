<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Chủ - DeliverAcct</title>
        <style>
            body { font-family: sans-serif; padding: 20px; }
            .menu-box { border: 1px solid #ddd; padding: 15px; margin-bottom: 20px; border-radius: 5px; }
            h3 { margin-top: 0; color: #007bff; }
            ul { list-style-type: none; padding: 0; }
            li { margin: 10px 0; }
            a { text-decoration: none; color: #333; font-weight: bold; }
            a:hover { color: red; }
            .logout { float: right; color: red; }
        </style>
    </head>
    <body>
        <%
            // Kiểm tra session, chưa đăng nhập thì đá về
            UserDTO user = (UserDTO) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <form>
            <button type="submit" class="btn-logout" name="action" value="Logout">Log Out</button>
        </form>
        
        <h1>Xin chào, <%= user.getFullName() %>!</h1>
        <p>Vai trò của bạn: 
            <% 
               int role = user.getRoleId();
               if(role==1) out.print("Admin");
               else if(role==2) out.print("Kế toán");
               else if(role==3) out.print("Thủ kho");
               else if(role==4) out.print("Tài xế");
               else out.print("Nhân viên");
            %>
        </p>
        <hr/>

        <% if (role == 1) { %>
        <div class="menu-box">
            <h3>Quản trị hệ thống</h3>
            <ul>
                <li><a href="userList.jsp">👉 Quản lý Người dùng (userList.jsp)</a></li>
                <li><a href="roleList.jsp">👉 Quản lý Phân quyền (roleList.jsp)</a></li>
                <li><a href="auditLog.jsp">👉 Xem Nhật ký hệ thống (auditLog.jsp)</a></li>
            </ul>
        </div>
        <% } %>

        <% if (role == 1 || role == 2) { %>
        <div class="menu-box">
            <h3>Kế toán & Đối soát</h3>
            <ul>
                <li><a href="#">Quản lý Hóa đơn (invoiceList.jsp)</a></li>
                <li><a href="#">Đối soát COD (codReconcile.jsp)</a></li>
            </ul>
        </div>
        <% } %>

        <% if (role == 1 || role == 3) { %>
        <div class="menu-box">
            <h3>Quản lý Kho</h3>
            <ul>
                <li><a href="#">Nhập kho (inboundList.jsp)</a></li>
                <li><a href="#">Xuất kho (outboundList.jsp)</a></li>
            </ul>
        </div>
        <% } %>
        
        <% if (role == 4) { %>
        <div class="menu-box">
            <h3>🚚 Dành cho Tài xế</h3>
            <ul>
                <li><a href="shipmentList.jsp">📦 Danh sách chuyến giao (shipmentList.jsp)</a></li>
                <li><a href="podUpload.jsp">📸 Upload bằng chứng giao hàng (podUpload.jsp)</a></li>
                <li><a href="shipmentHistory.jsp">Lịch sử chạy</a></li>
            </ul>
        </div>
        <% } %>

        <% if (role == 1 || role == 5) { %>
        <div class="menu-box">
            <h3>🎧 Chăm sóc khách hàng</h3>
            <ul>
                <li><a href="searchOrders.jsp">🔍 Tra cứu đơn hàng (searchOrders.jsp)</a></li>
                <li><a href="alertsList.jsp">⚠️ Xem cảnh báo rủi ro (alertsList.jsp)</a></li>
                <li><a href="caseList.jsp">📝 Xử lý khiếu nại & Sai lệch (caseList.jsp)</a></li>
            </ul>
        </div>
        <% } %>
    </body>
</html>