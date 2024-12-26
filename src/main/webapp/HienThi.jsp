<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Connect.DatabaseConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Sách</title>
    <style>
	table, th, td {
	  border: 1px solid black;
	  border-collapse: collapse;
	}
	</style>
</head>
<body>
<h1>Danh Sách Sách</h1>
<table>
    <tr>
        <th>Mã Sách</th>
        <th>Tên Sách</th>
        <th>Tác Giả</th>
        <th>Thể Loại</th>
        <th> </th>
    </tr>
    <%
        String sql = "SELECT Sach.MaSach, Sach.TenSach, TacGia.TenTacGia, TheLoai.TenTheLoai "
                   + "FROM Sach "
                   + "INNER JOIN TacGia ON Sach.TacGiaID = TacGia.id "
                   + "INNER JOIN TheLoai ON Sach.TheLoaiID = TheLoai.id;";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                String maSach = rs.getString("MaSach");
                String tenSach = rs.getString("TenSach");
                String tacGia = rs.getString("TenTacGia");
                String theLoai = rs.getString("TenTheLoai");
    %>
    <tr>
        <td><%= maSach %></td>
        <td><%= tenSach %></td>
        <td><%= tacGia %></td>
        <td><%= theLoai %></td>
        <td>
        <form action="EditSach.jsp">
          <input type="hidden" name="maSach" value="<%= maSach %>">
		  <input type="submit" value="Sửa">
		</form> 
		<form action="DeleteSachServlet">
          <input type="hidden" name="maSach" value="<%= maSach %>">
		  <input type="submit" value="Xóa">
		</form> 
        </td>
    </tr>
    <%
            }
        } catch (Exception e) {
            out.println("Lỗi: " + e.getMessage());
        }
    %>
</table><br><br>
        <form action="AddSach.jsp">
		  <input type="submit" value="Thêm Sách">
		</form> 
</body>
</html>
