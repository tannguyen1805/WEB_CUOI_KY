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
 * Servlet implementation class AddSachServlet
 */
@WebServlet("/AddSachServlet")
public class AddSachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		String tenSach = request.getParameter("tenSach");
		String tacGiaID = request.getParameter("tacGiaID");
		String theLoaiID = request.getParameter("theLoaiID");
		String sql = "INSERT INTO Sach (TenSach, TacGiaID, TheLoaiID) VALUES (?, ?, ?)" ;
     try (Connection connection = DatabaseConnection.getConnection();
          PreparedStatement st = connection.prepareStatement(sql)) {
    	  st.setString(1, tenSach);
    	  st.setString(2, tacGiaID);
    	  st.setString(3, theLoaiID);
          st.executeUpdate(); 
    	  response.sendRedirect("HienThi.jsp");
          }    
     catch (Exception e) {
    	 e.printStackTrace();
    	 response.getWriter().println("Lỗi khi thêm sách: " + e.getMessage());
     }
	}
}
