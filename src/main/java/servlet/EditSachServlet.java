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
 * Servlet implementation class EditSachServlet
 */
@WebServlet("/EditSachServlet")
public class EditSachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		String maSach = request.getParameter("maSach");
		String tenSach = request.getParameter("tenSach");
		String tacGiaID = request.getParameter("tacGiaID");
		String theLoaiID = request.getParameter("theLoaiID");
		String sql = "UPDATE Sach SET TenSach = ?, TacGiaID = ?, TheLoaiID = ? WHERE MaSach = ? ;" ;
     try (Connection connection = DatabaseConnection.getConnection();
          PreparedStatement st = connection.prepareStatement(sql)) {
    	  st.setString(1, tenSach);
    	  st.setString(2, tacGiaID);
    	  st.setString(3, theLoaiID);
    	  st.setString(4, maSach);
          st.executeUpdate(); 
    	  response.sendRedirect("HienThi.jsp");
          }    
     catch (Exception e) {
    	 e.printStackTrace();
    	 response.getWriter().println("Lỗi khi sửa sách: " + e.getMessage());
     }
	}

}
