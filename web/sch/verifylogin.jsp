<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try{
        String uname=request.getParameter("uname");
        String pwd=request.getParameter("pwd");
        String role=request.getParameter("role");
        System.out.print(uname);
        System.out.print(role);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fetch","root","root");
        String sql="select * from login where username='"+uname+"' and password='"+pwd+"' and role='"+role+"'";
        PreparedStatement ps=con.prepareStatement(sql);
        //Statement st = con.createStatement();
      ResultSet rs = ps.executeQuery(sql);
      // ResultSet rs= ps.executeQuery();
      

        
       if(rs.next())
       {
        //   System.out.print("verifyyinloop"+role+"finish");
           if(role.equals("doctor"))
           {
               session  = request.getSession();
               session.setAttribute("username",uname);
            response.sendRedirect("http://localhost:8084/WebApplication1/sch/dashboard.html");
           }
           
         
       
     
    
    
        if(role.equals("laboratory"))
           {
               session  = request.getSession();
               session.setAttribute("username",uname);
//               out.print("sucess");
//               String url ="http://localhost:8084/WebApplication1/sch/laboratory.jsp";     
            response.sendRedirect("http://localhost:8084/WebApplication1/sch/laboratory.jsp");
           }

         if(role.equals("patient"))
           {
               session  = request.getSession();
               session.setAttribute("username",uname);
//               out.print("sucess");
                response.sendRedirect("http://localhost:8084/WebApplication1/sch/patientprofile.jsp?patientid="+uname);     
           // response.sendRedirect(url);
          
       }
     
      
        if(role.equals("chemist"))
           {
               session  = request.getSession();
               session.setAttribute("username",uname);
//               out.print("sucess");
               String url ="http://localhost:8084/WebApplication1/sch/chemist.jsp";     
            response.sendRedirect(url);
          
       }
    }
      else
       {
            // if(role.equals("patient"))
           {
               System.out.println("verify login patient");
               session  = request.getSession();
               session.setAttribute("username",uname);
//               out.print("sucess");
               //String url =;     http://localhost:8084/WebApplication1/sch/patientprofile.jsp?patientid=EY46850
                response.sendRedirect("http://localhost:8084/WebApplication1/sch/patientprofile.jsp?patientid="+uname);
            
               
           }
       }
       }
    catch(Exception e)
    {
        out.print(e);
    }
 %>