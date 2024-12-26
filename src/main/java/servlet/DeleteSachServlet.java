package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connect.DatabaseConnection;

/**
 * Servlet implementation class DeleteSachServlet
 */
@WebServlet("/DeleteSachServlet")
public class DeleteSachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		String maSach = request.getParameter("maSach");
		String sql = "DELETE FROM SACH WHERE MaSach = ? ";
		try (Connection connection = DatabaseConnection.getConnection();
	         PreparedStatement st = connection.prepareStatement(sql)) {
	    	 st.setString(1, maSach);
	         st.executeUpdate(); 
	    	 response.sendRedirect("HienThi.jsp");
	         }    
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Lỗi khi xóa sách: " + e.getMessage());
		}
	}

}
