
<%@page import="java.sql.*"%>
<%
  String pid = request.getParameter("patientid");  
  String column = request.getParameter("column"); 
  System.out.println(pid);
  System.out.println(column);
  float  h = 0;
//  float  w = 0;
//  float  t = 0;
//  float  bp = 0;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient","root","root");
            String sql = "SELECT "+column +" FROM patient.vital where id='"+pid+"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next())
            {
                h = rs.getFloat(1);
//                w = rs.getFloat(3);
//                t = rs.getFloat(4);
//                bp = rs.getFloat(5);
                out.print(h);
            }
        }
        catch(Exception e)
        {
              System.out.println(e);
//              out.print("getvitalfunction error");
        }

%>
