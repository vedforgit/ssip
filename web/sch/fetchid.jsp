<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String id = request.getParameter("id");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient","root","root");
            String sql = "select phone from detail where id='"+id+"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next())
            {
                out.print(rs.getString(1));
            }
        }
        catch(Exception e)
        {
            out.print("error");
        }
%>