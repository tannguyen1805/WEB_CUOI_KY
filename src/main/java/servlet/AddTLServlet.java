package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connect.DatabaseConnection;

/**
 * Servlet implementation class AddTLServlet
 */
@WebServlet("/AddTLServlet")
public class AddTLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		String tenTheLoai = request.getParameter("tenTheLoai");
		String sql = "INSERT INTO TheLoai (TenTheLoai) VALUES (?)" ;
     try (Connection connection = DatabaseConnection.getConnection();
          PreparedStatement st = connection.prepareStatement(sql)) {
    	  st.setString(1, tenTheLoai);
          st.executeUpdate(); 
    	  response.sendRedirect("AddSach.jsp");
          }    
     catch (Exception e) {
    	 e.printStackTrace();
    	 response.getWriter().println("Lỗi khi thêm thể loại: " + e.getMessage());
     }
	}
}