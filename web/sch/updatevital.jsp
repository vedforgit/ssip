<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try
    {
        
        String id = request.getParameter("pid");
        String h = request.getParameter("height");
        String w = request.getParameter("weight");
        String t = request.getParameter("temprature");
        String b = request.getParameter("bloodpressure");
        float he = Float.parseFloat(h);
        float we = Float.parseFloat(w);
        float te = Float.parseFloat(t);
        float bp = Float.parseFloat(b);
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient ","root","root");
        Statement st = cn.createStatement();
        String sql = "update vital set height='"+he+"',weight='"+we+"',temprature='"+te+"',bloodpressure='"+bp+"'  where id='"+id+"'";
        int x= st.executeUpdate(sql);
        if(x>0)
        {
            out.print("Update");
        }
        else
        {
            out.print("Not Update");
        }
    }   
    catch(Exception e)
    {
        out.print(e);
    }
%>