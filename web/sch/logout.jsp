<%-- 
    Document   : logout
    Created on : 20 Jan, 2020, 8:38:50 PM
    Author     : vedant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    session.invalidate();
    session=request.getSession();
    response.sendRedirect("http://localhost:8084/WebApplication1/sch/index.html");
%>
