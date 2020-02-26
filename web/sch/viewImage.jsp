<%-- 
    Document   : viewImage
    Created on : 25 Feb, 2020, 11:12:55 PM
    Author     : vedant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <!--<b>View | <a href="patientprofile.jsp">Upload</a></b><br/><br/>-->

		<%
		String pid = request.getParameter("patientid");
                System.out.print("viewimage"+pid);
                String temp="patientprofile.jsp?patientid="+pid;
                response.sendRedirect(temp);
                
		%>
		<img src="getImage.jsp?patientid=<%=pid%>" width="400px"/>
    </body>