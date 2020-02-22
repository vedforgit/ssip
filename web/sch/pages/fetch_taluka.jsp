<%-- 
    Document   : fetch_distric
    Created on : 11 Jan, 2020, 7:13:54 PM
    Author     : vedant
--%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

         String url="jdbc:mysql://localhost:3306/fetch";
         String uname="root";
	 String pwd="root";
         //String dec=request.getParameter("district");
         String sql1="select taluka from district_detail where district='"+request.getParameter("district")+"'";
    try
    {
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con = DriverManager.getConnection(url,uname,pwd);
	       
	PreparedStatement ps=con.prepareStatement(sql1);
        ResultSet rs = ps.executeQuery();    
        while(rs.next())
        {
            out.print("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
        }
       
    }
    catch(Exception e)
    {
        out.println(e);
    }

 %>