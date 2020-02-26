<%-- 
    Document   : logoutdr
    Created on : 26 Feb, 2020, 1:48:39 AM
    Author     : Parthik Shah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//    String pid = request.getParameter("patientid");  
//    System.out.print("logoutdr"+pid);
//    session = request.getSession();
//    session.setAttribute("patientid",pid);
    
//    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
//    session.invalidate();
    session=request.getSession();
    String username=(String)session.getAttribute("username");
    System.out.print("logoutdr"+username);
    response.sendRedirect("http://localhost:8084/WebApplication1/sch/dashboard.html");
%>

