package come.insert;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


/**
 * Servlet implementation class insert
 */
public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)s
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Email=request.getParameter("booking_email");
		String phoneNumber=request.getParameter("booking_phone");
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String selectDate=request.getParameter("selectDate");
		String tableNumber=request.getParameter("tableNumber");
		String specialMenu=request.getParameter("special_menu");
		String drinks=request.getParameter("drinks");
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
			Class.forName("com.mysqljdbc.driver");
			Connection con=DriverManager.getConnection("jdbc:mysql//localhost:3306/arrnet","Arrnet","1234");
		String sql="insert into tbl_booking value(?,?,?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1,Email);
	ps.setString(2,phoneNumber);
	ps.setString(3,firstName);
	ps.setString(4,lastName);
	ps.setString(5,selectDate);
	ps.setString(6,tableNumber);
	ps.setString(7,specialMenu);
	ps.setString(8,drinks);
	ps.executeUpdate();
	out.println("data inserted in your database....");
	ps.close();
	con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
