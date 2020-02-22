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
         String sql1="SELECT distinct district FROM district_detail";
    try
    {
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con = DriverManager.getConnection(url,uname,pwd);
	       
	PreparedStatement ps=con.prepareStatement(sql1);
        ResultSet rs = ps.executeQuery();
       //out.print("<select>");    
        while(rs.next())
        {
            out.print("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
        }
//        out.print("</select>");
       
    }
    catch(Exception e)
    {
        out.println(e);
    }

 %>