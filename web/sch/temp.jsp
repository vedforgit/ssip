<%-- 
    Document   : temp
    Created on : 27 Feb, 2020, 3:53:20 PM
    Author     : vedant
--%>

<%@page import="io.joshworks.restclient.http.Unirest"%>
<%
    try{
       out.print(Unirest.get("https://www.fast2sms.com/dev/bulk?authorization=10lU8ig9HPpxIsAk7TyuRcFho2GezCrbNaJdWmXtVB6fOS4Zv3bHnZK4kxspf3Sgoa1WFBjE9uAIQy28&sender_id=FSTSMS&language=english&route=qt&numbers=9054504099&message=YOUR_QT_TEMPLATE_ID&variables={AA}|{CC}&variables_values=12345|asdaswdx").header("cache-control", "no-cache").asString());
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>