<%-- 
    Document   : verifylogin
    Created on : 20 Jan, 2020, 7:55:21 PM
    Author     : vedant
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try{
        String uname=request.getParameter("uname");
        String pwd=request.getParameter("pwd");
        String role=request.getParameter("role");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fetch","root","root");
        String sql="SELECt * from login where username='"+uname+"' and password='"+pwd+"' and role='"+role+"'";
       PreparedStatement ps=con.prepareStatement(sql);
       ResultSet rs = ps.executeQuery();
       if(rs.next())
       {
           if(role.equals("doctor"))
           {
               session  = request.getSession();
               session.setAttribute("username",uname);
//               out.print("sucess");
            response.sendRedirect("http://localhost:8084/WebApplication1/sch/dashboard.html");
           }
       }
    }
    catch(Exception e)
    {
        out.print(e);
    }
 %>