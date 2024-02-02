<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
String Email=request.getParameter("booking_email");
String phoneNumber=request.getParameter("booking_phone");
String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String selectDate=request.getParameter("selectDate");
String tableNumber=request.getParameter("tableNumber");
String specialMenu=request.getParameter("special_menu");
String drinks=request.getParameter("drinks");
%>
<%
Connection conn = null;
try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arrnet","root","");
    String sql="insert into tbl_booking (booking_email,booking_phone,firstName,lastName,selectDate,tableNumber,special_menu,drinks)value(?,?,?,?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
ps.setString(1,Email);
ps.setString(2,phoneNumber);
ps.setString(3,firstName);
ps.setString(4,lastName);
ps.setString(5,selectDate);
ps.setString(6,tableNumber);
ps.setString(7,specialMenu);
ps.setString(8,drinks);

    ps.executeUpdate();
    ps.close();
    String sql1="SELECT * FROM tbl_booking";
	PreparedStatement ps1=conn.prepareStatement(sql1);
    out.println("<script> alert('Registration Successful'); </script>");
    out.println("<script> location.href='your_booking.jsp'; </script>");
    response.sendRedirect("your_booking.jsp?id=ps1.getString('id')");
}catch(Exception e){
     out.println(e);   
} 
%>
