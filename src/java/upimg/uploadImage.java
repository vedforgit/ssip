/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package upimg;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Parthik Shah
 */
@WebServlet(name = "uploadImage", urlPatterns = {"/sch/uploadImage"})
@MultipartConfig(maxFileSize = 1000177216)
public class uploadImage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 // String url="jdbc:mysql://localhost:6740/bisag";
//		   String uname="root";
//		   String pwd="root";
                   Connection con=null;
                   int result=0;
                   Part part = request.getPart("file123");
                   String p = "";
                   if(part != null)
                   {
                       try
                       {
                           HttpSession session=request.getSession();
                             p=(String)session.getAttribute("patientid");
                            System.out.println("uploadimage"+p);
                           
                           String sql1="UPDATE detail SET photo=? WHERE id='"+p+"'";;
                   Class.forName("com.mysql.jdbc.Driver");
                   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient","root","root"); 
                   PreparedStatement ps=con.prepareStatement(sql1);
                   InputStream is = part.getInputStream();
                   ps.setBlob(1,is);
                                
                           result=ps.executeUpdate();
                           
                       }
                       catch(Exception e)
                           
                       {
                           e.printStackTrace();
                       }
                       finally{
                           if (con !=null)
                           {
                        try{
				con.close();
                              }
			catch(Exception e)
                        {
			         e.printStackTrace();
			}
                           
                       }
                   }       
        
        
        
        
                   }
   if(result > 0){
       String temp = "result.jsp?patientid="+p;
	    	response.sendRedirect(temp);
	    }
		else{
			response.sendRedirect("result.jsp?message=Some+Error+Occurred");

}
}

}
