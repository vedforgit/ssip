<%-- 
    Document   : fetchsymptoms
    Created on : 26 Feb, 2020, 6:16:38 PM
    Author     : vedant
--%>

<%@page import="java.sql.*"%>
<%

         String url="jdbc:mysql://localhost:3306/fetch";
         String uname="root";
	 String pwd="root";
         String sql1="SELECT disease FROM fetch.disease";
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