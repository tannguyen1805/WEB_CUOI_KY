<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Connect.DatabaseConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Sách</title>
</head>
<body>
<h1>Danh Sách Thể Loại</h1>
<table>
    <tr>
        <th>Mã Thể Loại</th>
        <th>Tên Thể Loại</th>
    </tr>
    <%
        String sql1 = "SELECT id, TenTheLoai FROM TheLoai ";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement st = connection.prepareStatement(sql1);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                String maTheLoai = rs.getString("id");
                String tenTheLoai = rs.getString("TenTheLoai");
    %>
    <tr>
        <td><%= maTheLoai %></td>
        <td><%= tenTheLoai %></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            out.println("Lỗi: " + e.getMessage());
        }
    %>
</table><br>
<h1>Thêm Thể Loại</h1>
        <form action="AddTLServlet">
        Tên Thể Loại: <input type="text" name="tenTheLoai" ><br>
        <input type="submit" value="Thêm">
	    </form><br><br><br>
<h1>Danh Sách Tác Giả</h1>
<table>
    <tr>
        <th>Mã Tác Giả</th>
        <th>Tên Tác Giả</th>
    </tr>
    <%
        String sql2 = "SELECT id, TenTacGia FROM TacGia ";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement st = connection.prepareStatement(sql2);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                String maTacGia = rs.getString("id");
                String tenTacGia = rs.getString("TenTacGia");
    %>
    <tr>
        <td><%= maTacGia %></td>
        <td><%= tenTacGia %></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            out.println("Lỗi: " + e.getMessage());
        }
    %>
</table><br>
<h1>Thêm Tác Giả</h1>
        <form action="AddTGServlet">
        Tên Tác Giả: <input type="text" name="tenTacGia" ><br>
        <input type="submit" value="Thêm">
	    </form><br><br><br>
<h1>Thêm Sách</h1>
    <form action="AddSachServlet">
		Tên Sách: <input type="text" name="tenSach" ><br>
        Mã Tác Giả: <input type="text" name="tacGiaID" ><br>
        Mã Thể Loại: <input type="text" name="theLoaiID" ><br>
        <input type="submit" value="Thêm">
	</form><br><br>
 
</body>
</html>
