<%-- 
    Document   : result
    Created on : 25 Feb, 2020, 11:11:37 PM
    Author     : vedant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String pid = request.getParameter("patientid");
if(pid != null){
	out.print("result.jsp"+pid);
        String temp="viewImage.jsp?patientid="+pid;
        response.sendRedirect(temp);
}
%>