<%-- 
    Document   : patientotp
    Created on : 25 Feb, 2020, 9:12:29 AM
    Author     : vedant
--%>

<%@page import="mail.SendEmail"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     String msg="error otp not send";
//            
//            InputStream inputStream = null;
          
     String un=request.getParameter("username");
     out.print(un);
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient","root","root");
     String sql="SELECT email FROM patient.detail where id='"+un+"'";

//     ps.setString(1,un);
     Statement st = con.createStatement();
     ResultSet rs = st.executeQuery(sql);
     String email="";
     while(rs.next())
     {
         email = rs.getString(1);
         //out.print(email);
         System.out.println(email);
     }
//     con.close();
     String otp = RandomStringUtils.randomNumeric(4);
     while(otp.length()!=4)
     {
         otp = RandomStringUtils.randomNumeric(4);
     }
     String role = "patient";
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fetch","root","root");
     sql = "INSERT INTO login (username,password,role) VALUES (?,?,?)";
     //Statement st  = con.createStatement();
     PreparedStatement ps=con.prepareStatement(sql);
     ps.setString(1,email);
     ps.setString(2,otp);
     ps.setString(3,role);
     //boolean x=st.execute(sql);
     
     int x = ps.executeUpdate();
     if(x!=0)
     {
         msg = "otp add database";
         String temp = "your otp for login is <b>"+otp+"</b>";
         System.out.println(msg);
         SendEmail se = new SendEmail();
         
         boolean y=se.sendfile("medssip@gmail.com","medssip@123",email.toString(),temp);
         if(y==false)
         {
             out.print("otp not send in mail");
         }
         else
         {
             out.print("please check your mail");
         }
     }   
//con.close();
     
%>