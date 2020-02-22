<%-- 
    Document   : addpatient
    Created on : 20 Jan, 2020, 5:23:40 PM
    Author     : vedant
--%>
<%@page import="java.sql.*"%>
<%@page  import="org.apache.commons.lang.RandomStringUtils" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String firstname=request.getParameter("firstname");
    String lastname=request.getParameter("lastname");
    String gender = request.getParameter("gender");
    String day = request.getParameter("dob");
    String address = request.getParameter("address");
    String district = request.getParameter("district");
    String taluka = request.getParameter("taluka");
    int phone = Integer.parseInt(request.getParameter("phone"));
    String email = request.getParameter("email");
    int aadhar = Integer.parseInt(request.getParameter("aadhar"));
    String temps = RandomStringUtils.randomAlphabetic(2);
     while(temps.length()!=2)
     {
         temps = RandomStringUtils.randomAlphabetic(2);
     }
     String tempi =RandomStringUtils.randomNumeric(5).toString();
     while(tempi.length()!=5)
     {
         tempi =RandomStringUtils.randomNumeric(5).toString();
     }
     String id =temps.concat(tempi).toUpperCase();
     Date date = Date.valueOf(day);
     
     try
     {
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient","root","root");
         String sql = "insert into detail(id,firstname,lastname,gender,dob,address,district,taluka,phone,email,aadhar)values(?,?,?,?,?,?,?,?,?,?,?)";
         
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setString(1,id);
         ps.setString(2,firstname);
         ps.setString(3,lastname);
         ps.setString(4,gender);
         ps.setDate(5, date);
         ps.setString(6,address);
         ps.setString(7,district);
         ps.setString(8,taluka);
         ps.setInt(9,phone);
         ps.setString(10,email);
         ps.setInt(11,aadhar);
         int x = ps.executeUpdate();
         if(x==0)
         {
             out.print("Error");
         }
         else
         {
             out.print("Success");
         }
         
     }   
     catch(Exception e)
     {
         out.print(e);
     }
     


    
%>