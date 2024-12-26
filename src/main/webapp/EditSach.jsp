<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Connect.DatabaseConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Sách</title>
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
</table><br><br><br>
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
</table><br><br><br>
<h1>Chỉnh Sửa Sách</h1>
    <%
        String maSach = request.getParameter("maSach");
	    String tenSach = "";
	    String tacGiaID = "";
	    String theLoaiID = "";
        String sql = "SELECT TenSach, TacGiaID, TheLoaiID "
                   + "FROM Sach "
                   + "WHERE MaSach = ? ;" ;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement st = connection.prepareStatement(sql)){
        	 st.setString(1, maSach);
             ResultSet rs = st.executeQuery() ;
             if (rs.next()) {
                tenSach = rs.getString("TenSach");
                tacGiaID = rs.getString("TacGiaID");
                theLoaiID = rs.getString("TheLoaiID");
             }
        } catch (Exception e) {
            out.println("Lỗi: " + e.getMessage());
        }
    %>
    <form action="EditSachServlet">
        <input type="hidden" name="maSach" value="<%= maSach %>"><br>
		Tên Sách: <input type="text" name="tenSach" value="<%= tenSach %>"><br>
        Mã Tác Giả: <input type="text" name="tacGiaID" value="<%= tacGiaID %>"><br>
        Mã Thể Loại: <input type="text" name="theLoaiID" value="<%= theLoaiID %>"><br>
        <input type="submit" value="Lưu và thay đổi">
	</form><br><br>
 
</body>
</html>
