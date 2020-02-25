<%-- 
    Document   : getImage
    Created on : 25 Feb, 2020, 3:14:38 PM
    Author     : Parthik Shah
--%>

<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
        <%
            String patientid = request.getParameter("pid");
              String url="jdbc:mysql://localhost:3306/patient";
		   String uname="root";
		   String pwd="root";
                   
                Connection con = null;
                try
                {
                     Class.forName("com.mysql.jdbc.Driver"); 
        	      con=DriverManager.getConnection(url,uname,pwd);
                      String p=(String)session.getAttribute("patientid");
                      System.out.print("value of p"+p);
                 String sql1="SELECT photo FROM detail WHERE id='"+p+"'";
                  Statement st=con.createStatement();
                    st.executeQuery(sql1);
                 ResultSet rs = st.executeQuery(sql1);
                 
 
                 if(rs.next()){
        Blob blob = rs.getBlob("photo");
        byte byteArray[] = blob.getBytes(1, (int)blob.length());
 
        response.setContentType("image/gif");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
        

                }
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                finally{
    if(con != null){
        try{
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
         %>
